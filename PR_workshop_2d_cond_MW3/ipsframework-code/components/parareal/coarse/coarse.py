#! /usr/bin/env python

from  component import Component
import subprocess
import shutil
import glob
from numpy import array
import os
class PararealCoarse(Component):
    def __init__(self, services, config):
        Component.__init__(self, services, config)
        print 'Created %s' % (self.__class__)

    def init(self, timeStamp=0.0):
        # get the input files
        try:
            print self.INPUT_FILES, 'the input files'
            print self.INPUT_DIR, 'the path to the files'
            self.services.stage_input_files(self.INPUT_FILES)
            # copy input file[0], the restart file, to
            # fine_out.0000.ps
            shutil.copy(self.INPUT_FILES.split()[0], 'fine_out.0000.ps')
            #delete this later
            shutil.copy(self.INPUT_FILES.split()[0], 'coarse_out.0000.ps')
        except:
            print 'error in renaming  input files'
            raise
        self.nt_slice = int(self.COARSE_PARAMS.split()[1])
        self.services.update_plasma_state()
        return

    def step(self, timeStamp=0.0):
        # each step will be treated as an iteration--
        # actual time is not used
        print 'Hello from PararealCoarse'
        #get the plasm state
        self.services.stage_plasma_state()

        # get the input stuff
        n_slice =int(self.nt_slice)
        # now do some real stuff
        curdir = self.services.get_working_dir()
        print self.COARSE_PARAMS
        #get the list of coarse parameters
        cmds = self.COARSE_PARAMS.split()
        print 'coarse cmds are ', cmds
        print float(cmds[0]), int(cmds[1]), int(cmds[2])
        print 'coarse dt = ', float(cmds[0]) / n_slice / int(cmds[2])
        # assumes that the input file (restart file is the first in the list
        # then need to copy it to coarse_out.0000.ps
        coarse_bin = self.COARSE_BIN 
        print  'exe for coarse solver = ', coarse_bin
        # for the first step, run through the solver without any 
        # fine input
        # need to get N_CONV
        n_conv = int(self.services.get_config_param('N_CONV'))
        for i in range(n_conv + 1, n_slice + 1):
            print 'starting the coarse slice slice = ', i
            # need to contsruct suffixes of i and i-1
            # padded to four digits
            # first for i
            pad_nu  = 4 - len(str(i))
            suffix = ''
            for i_pad in range(1, pad_nu + 1):
                suffix = str(0) + suffix
            i_suffix = '.' + suffix + str(i)
            # now for i-1
            pad_nu  = 4 - len(str(i - 1))
            suffix = ''
            for i_pad in range(1, pad_nu + 1):
                suffix = str(0) + suffix
            i_suffix_m = '.' + suffix + str(i - 1)
            # the input file is alwasys coarse_out.(i-1)
            if n_conv != 0:
                # coarse out will be modified in place
                # the rule is:  coarse_out.i.ps = fine_out.i.ps + coarse_out.i.ps - coarse.i.psp
                # the following is specific to the LORENZ
                # will have to be put in an if block
                # open the three files, get data
                fine_out_ps = open('fine_out' + i_suffix_m + '.ps', 'r')
                fine_ps_data = array(map(float, fine_out_ps.readline().split()))
                print 'in order we will get c, cp, f'
                coarse_out_ps = open('coarse_out' + i_suffix_m + '.ps', 'r')
                coarse_ps_data = array(map(float, coarse_out_ps.readline().split()))
                coarse_out_psp = open('coarse_out' + i_suffix_m + '.psp', 'r')
                coarse_psp_data = array( map(float, coarse_out_psp.readline().split()))
                #close the files
                print coarse_ps_data
                print coarse_psp_data
                print fine_ps_data
                fine_out_ps.close(); coarse_out_psp.close(); coarse_out_ps.close()
                # open the out file and overwrite
                coarse_out_ps = open('coarse_out' + i_suffix_m + '.ps', 'w')
                new_dat = fine_ps_data + coarse_ps_data - coarse_psp_data
                print new_dat
                for j in range(len(new_dat)):
                    print >> coarse_out_ps, str(new_dat[j]),
                coarse_out_ps.close()
            file_in = os.path.join(curdir, 'coarse_out' +  i_suffix_m +  '.ps')
            # the output file is always coarse_out.00(n_conv +1)
            file_out = os.path.join(curdir, 'coarse_out' +  i_suffix + '.ps')
            
            # construct the reset of the command line
            #nstep = str(10)
            plot_file = os.path.join(curdir, 'plot_coarse' +  i_suffix)
            cmd = cmds + [file_in, file_out, plot_file]
            print 'command line args for coarse = ', cmd
            task_id = self.services.launch_task(self.NPROC, curdir, coarse_bin, \
            *cmd, logfile='coarse.log')  
            try:
                retval = self.services.wait_task(task_id)
                if retval != 0:
                    print 'coarse slice returned in error = ', retval
                    raise 
            except Exception:
                self.services.exception('coarse slice failed to complete')
                raise
            # need to use n_conv logic
            # if n_conv = 0, don't need to do anything to coarse out
            print 'finished coarse step = ',  i_suffix
        try:
            self.services.update_plasma_state()
        except Exception:
            self.services.exception('coarse slice update state failed')
            raise
        
        try:
            self.services.stage_output_files(timeStamp, self.OUTPUT_FILES)
        except Exception:
            self.services.exception('coarse slice stage output failed')
            raise
        # need to create prior state for purposes of doing the next advance
        out_list = glob.glob('coarse_out.0*.ps')
        print out_list
        
        print 'after glob'
        for file_out in out_list:
            try:
                print file_out
                shutil.copy(file_out, file_out + 'p')
            except Exception:
                self.services.exception('present to past copy failed in coarse')
                raise
        return
    
    def finalize(self, timeStamp=0.0):
        return
    
