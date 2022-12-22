#! /usr/bin/env python

from  component import Component
import subprocess
import shutil
import glob
#from numpy import array
import os
class Coarse(Component):
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
            shutil.copy(self.INPUT_FILES.split()[0], 'inputs')
            #delete this later
            shutil.copy(self.INPUT_FILES.split()[1], 'coarse_out.0000.ps')
        except:
            print 'error in renaming  input files'
            raise

        self.nt_slice = int(self.services.get_config_param('NT_SLICE'))
        subprocess.call(['touch','fine_out.empty.ps'])
        subprocess.call(['touch','energy_fine.empty.ps'])
        self.services.update_plasma_state()
        return

    def step(self, timeStamp=0.0):
        # each step will be treated as an iteration--
        # actual time is not used
        print 'Hello from PararealCoarse'
        #get the plasm state
        self.services.stage_plasma_state()

        # get the input stuff
        n_slice = self.nt_slice
        # now do some real stuff
        curdir = self.services.get_working_dir()
        #get the list of coarse parameters
        cmds = self.COARSE_PARAMS.split()
        print 'coarse cmds are ', cmds
#       print float(cmds[0]), int(cmds[1]), int(cmds[2])
#       print 'coarse dt = ', float(cmds[0]) / n_slice / int(cmds[2])
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
            i_suffix = '%04d' %i
            i_suffix_m  = '%04d' %(i - 1)
            out_suffix =  str(n_conv) + '.' + str(i)
            # get the bins for the coarse to fine and fine to coarse exes
            c2f_bin = self.C2F_BIN
            f2c_bin = self.F2C_BIN
            adv_bin = self.ADV_BIN
            file_in =  'coarse_in.' +  i_suffix_m +  '.ps'
            file_in_fine = 'fine_out.' +  i_suffix_m +  '.ps'
            if n_conv != 0:
                # coarse out will be modified in place
                # the rule is:  coarse_out.i.ps = fine_out.i.ps + coarse_out.i.ps - coarse.i.psp
                # first convert coarse out ps and psp to fine files
                # that are padded with zeros
                coarse_out_psp = 'coarse_out.' + i_suffix_m + '.psp'
                coarse_out_ps = 'coarse_out.' + i_suffix_m + '.ps'
                fine_out_ps = 'fine_out.' + i_suffix_m + '.ps'
                if i == n_conv:
                    #  only need to extract the coarse modes
                    #  from the fine_in file
                    subprocess.call([f2c_bin, file_in_fine, file_in,
                        '1', '192', '192', '100', '100'])
                else:
                    #  fill high-k modes with zeros for psp
                    subprocess.call([c2f_bin, coarse_out_psp, 'coarse_fine_psp', 
                       '2', '192', '192', '100', '100'])
                    #  fill high-k modes with zeros for ps
                    subprocess.call([c2f_bin, coarse_out_ps, 'coarse_fine_ps', 
                         '2', '192', '192', '100', '100'])
                    #now with the three files, call the parareal advance
                    subprocess.call([adv_bin, fine_out_ps, 'coarse_fine_psp',
                     'coarse_fine_ps',  'coarse_advance_padded', '385', '385'])
                    #this file now needs to be coarsened
                    subprocess.call([f2c_bin, 'coarse_advance_padded', file_in,
                     '1', '192', '192', '100', '100'])
                    shutil.copy('coarse_advance_padded', file_in_fine)
            else:
                file_in = 'coarse_out.' +  i_suffix_m + '.ps'
            # the output file is always coarse_out.00(n_conv +1)
            file_out =  'coarse_out.' +  i_suffix + '.ps'
            
            # construct the reset of the command line
            #nstep = str(10)
            energy_out =  'energy_coarse.' +  i_suffix
            cmd = cmds + [file_in, file_out, energy_out, out_suffix]
            print 'command line args for coarse = ', cmd
            task_id = self.services.launch_task(self.NPROC, curdir, coarse_bin, \
            *cmd, logfile='coarse.' + i_suffix + '.log')  
            try:
                retval = self.services.wait_task(task_id)
                if retval != 0:
                    print 'coarse slice returned in error = ', retval
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
        
       #try:
      #     self.services.stage_output_files(timeStamp, self.OUTPUT_FILES)
      # except Exception:
      #     self.services.exception('coarse slice stage output failed')
      #     raise
        # need to create prior state for purposes of doing the next advance
        out_list = glob.glob('coarse_out.0*.ps')
        #print out_list
        
        #print 'after glob'
        for file_out in out_list:
            try:
               # print file_out
                shutil.copy(file_out, file_out + 'p')
            except Exception:
                self.services.exception('present to past copy failed in coarse')
                raise
        #clean out all of the old state stuff
        old_files = glob.glob('*.ps')
        for o_file in old_files:
            os.remove(o_file)
        return
    
    def finalize(self, timeStamp=0.0):
        return
    
