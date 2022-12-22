#! /usr/bin/env python

from  component import Component
import os
import glob
import shutil
import subprocess
from math import sqrt

class Converge(Component):
    def __init__(self, services, config):
        Component.__init__(self, services, config)
        print 'Created %s' % (self.__class__)

    def init(self, timeStamp=0.0):
        self.services.set_config_param('N_CONV', '0')
        #print 'convergence init N_CONV = ',  self.services.get_config_param('N_CONV')
        print 'tolerance = ', float(self.TOL)
        self.iteration = 0
        print 'completed converge init'
        
        return

    def step(self, timeStamp=0.0):
        print 'Hello from PararealConverge'
        self.services.stage_plasma_state()
        nt_slice = int(self.services.get_config_param('NT_SLICE'))
        print 'nt_slice = ', nt_slice
        conv_bin = self.CONV_BIN
        print 'convergence exe = ', conv_bin
        n_conv = int(self.services.get_config_param('N_CONV'))
        #always add one to the converged parameter
        #one more has converged just because of one additional
        #fine slice
        self.iteration += 1
        n_conv += 1
        print 'n_converg = ', n_conv
        #need a temp so we don't change index in middle of loop
        n_conv_temp = n_conv 
        # need to generate suffixes
        # ought to make this 
        if n_conv == 1:
            # first time through--no test
            fine_out_energy_list = glob.glob('energy_fine.0*.ps')
            fine_out_energy_list.sort()
      # elif n_conv == nt_slice:
      #     fine_out_energy_list = glob.glob('energy_fine.0*.ps')
      #     fine_out_energy_list.sort()
        else:
            #take the difference for between psp and ps, when
            #less that tolerance, pass, when greater, set converged
            #slice number to where we are less one, then set the number
            #for other components
            fine_out_energy_list = glob.glob('energy_fine.0*.ps')
            fine_out_energy_list.sort()
            fine_out_energy_list_prev = glob.glob('energy_fine.0*.psp')
            fine_out_energy_list_prev.sort()
            #rint 'made it to the loop'
            i_prev = 1
            for i in range(n_conv, nt_slice+1):
                print 'new file ', fine_out_energy_list[i] 
                print 'old file ', fine_out_energy_list_prev[i] 
                conv_file = 'conv.' + str(i)+ '.' + str(n_conv)
                cmd_list = [conv_bin, fine_out_energy_list_prev[i],
                   fine_out_energy_list[i], conv_file, self.TOL]
                print 'converge cmd list = ', cmd_list
                subprocess.call(cmd_list)
                f_conv_file = open(conv_file, 'r')
                conv_str = f_conv_file.readline()
                err = float(f_conv_file.readline())
                err_str = '%10.3e' % err
                f_conv_file.close()
                print 'convergence string = ', conv_str, 'iteration = ', self.iteration
                self.services.send_portal_event('converge_out', str(self.iteration) + ' ' + 
                     str(i) +  ' ' +  err_str)
                
                if int(conv_str) == 1 :
                    print 'error  = ', err,  'n_conv = ', n_conv_temp
                    #want to get conv value for first slice even if we know
                    #that it is already converged.
                    if n_conv < nt_slice and i != n_conv:
                        n_conv_temp += 1 * i_prev
                if int(conv_str) == 0 and i != n_conv:
                    i_prev = 0
        #need to save the old fine state for comparison on the next
        #iteration
        for file in fine_out_energy_list:
           #print 'creating prev files in converg ', file + 'p'
            try:
                shutil.copy(file, file + 'p')
            except:
                self.services.excetpion('previous energy save failed')
                raise
        #don't need to save a plasma state
        #update the n_conv
        self.services.set_config_param('N_CONV', str(n_conv_temp))
        print 'finished converge test N_CONV = ', n_conv_temp
        old_files = glob.glob('*.ps')
        for o_file in old_files:
            os.remove(o_file)
        return
    
    def finalize(self, timeStamp=0.0):
        return
    
