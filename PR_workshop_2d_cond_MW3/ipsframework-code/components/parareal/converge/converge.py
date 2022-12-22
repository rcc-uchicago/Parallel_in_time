#! /usr/bin/env python

from  component import Component
import glob
import shutil
from math import sqrt

class PararealConverge(Component):
    def __init__(self, services, config):
        Component.__init__(self, services, config)
        print 'Created %s' % (self.__class__)

    def init(self, timeStamp=0.0):
        self.services.set_config_param('N_CONV', '0')
        #print 'convergence init N_CONV = ',  self.services.get_config_param('N_CONV')
        print 'float = ', float(self.TOL)
        print 'completed converge init'
        return

    def step(self, timeStamp=0.0):
        print 'Hello from PararealConverge'
        self.services.stage_plasma_state()
        nt_slice = int(self.services.get_config_param('NT_SLICE'))
        print 'nt_slice = ', nt_slice
        n_conv = int(self.services.get_config_param('N_CONV'))
        #always add one to the converged parameter
        #one more has converged just because of one additional
        #fine slice
        n_conv += 1
        print 'n_converg = ', n_conv
        sim_type = self.services.get_config_param('SIM_TYPE')
        print 'sim type = ', sim_type
        tol = float(self.TOL)
        #need a temp so we don't change index in middle of loop
        n_conv_temp = n_conv 
        if n_conv == 1:
            # first time through--no test
            if sim_type == 'LORENZ':
                fine_out_list = glob.glob('fine_out.0*.ps')
                fine_out_list.sort()
        elif n_conv == nt_slice:
            fine_out_list = glob.glob('fine_out.0*.ps')
            fine_out_list.sort()
        else:
            #take the difference for between psp and ps, when
            #less that tolerance, pass, when greater, set converged
            #slice number to where we are less one, then set the number
            #for other components
            if sim_type == 'LORENZ':
                fine_out_list = glob.glob('fine_out.0*.ps')
                fine_out_list.sort()
                fine_out_list_prev = glob.glob('fine_out.0*.psp')
                fine_out_list_prev.sort()
                print 'made it to the loop'
                for i in range(n_conv + 1, nt_slice + 1):
                    data_new = map(float, open(fine_out_list[i],\
                      'r').readline().split())
                    print 'new file ', fine_out_list[i] 
                    print 'data new ', data_new, 'i = ', i
                    data_old = map(float, open(fine_out_list_prev[i]\
                      ,'r').readline().split())
                    print 'old file ', fine_out_list_prev[i] 
                    print 'data old ', data_old, 'i = ', i
                    num = 0.0
                    denom = 0.0
                    for j in range(1, 4):
                        num = num + (data_old[j] - data_new[j])**2
                        denom = denom + (data_old[j] + data_new[j])**2
                    err = sqrt(2.0 * num / denom)
                    if tol > err:
                        n_conv_temp += 1
                        print 'tolerance = ', tol, 'err = ', err, 'n_conv = ', n_conv_temp
            elif sim_type == 'NEW':
                #add new sim here
                pass
            else:
                print 'why not in if statement'
            
        #need to save the old fine state for comparison on the next
        #iteration
        for file in fine_out_list:
            print 'creating prev files in converg ', file + 'p'
            try:
                shutil.copy(file + 'p', file + 'pp')
            except:
                print 'free fail for first time'
            shutil.copy(file, file + 'p')
        #don't need to save a plasma state
        #update the n_conv
        self.services.set_config_param('N_CONV', str(n_conv_temp))
        print 'finished converge test N_CONV = ', n_conv_temp
        return
    
    def finalize(self, timeStamp=0.0):
        return
    
