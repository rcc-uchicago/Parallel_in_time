#! /usr/bin/env python

from  component import Component
import os
import glob
import subprocess
import shutil
class Fine(Component):
    def __init__(self, services, config):
        Component.__init__(self, services, config)
        print 'Created %s' % (self.__class__)

    def init(self, timeStamp=0.0):
        print 'fine init'
        try:
            self.services.stage_input_files(self.INPUT_FILES)
        except:
            self.services.exception('failed input file stage in fine')
            raise
        print 'fine input files = ', self.INPUT_FILES
        # need to copy initial input files and rename
        # put in a dummmpy energy file to keep it happy
        subprocess.call(['touch', 'energy_fine.0000.ps'])
        subprocess.call(['touch', 'coarse_out.empty.ps'])

        try:
            shutil.copy('initspec_fine', 'fine_out.0000.ps')
            shutil.copy('inputs_fine', 'inputs')
        except:
            self.services.exception('input file copy failed in fine init')
            raise
        self.services.update_plasma_state()
        self.fine_task_pool = False
        return

    def step(self, timeStamp=0.0):
        print 'starting fine iteration'
        #get the configuration information
        cmds = self.FINE_PARAMS.split()
        nt_slice = int(self.services.get_config_param('NT_SLICE'))
        print 'time slices = ', nt_slice
        self.services.stage_plasma_state()
        fine_wrkdir = self.services.get_working_dir()
        #now ready to launch the parallel fine steps
        #for the first step, the loop will be over all slices--
        c2f_bin = self.C2F_BIN
        fine_taskid_list = []
        fine_bin = self.FINE_BIN
        print 'fine exe = ', fine_bin
        # a value of zero  means that nothing has converged 
        # first time through
        n_converge = int(self.services.get_config_param('N_CONV'))
        print 'n_converge = ',n_converge, ' in fine'
        #new api--create a task pool
        if not self.fine_task_pool: 
            try:
                task_pool = self.services.create_task_pool('fine_parareal')
                self.fine_task_pool = True
            except:
                self.services.exception('could not create task pool in fine')
                raise
        for i in range(n_converge + 1, nt_slice+1):
            #construct suffix for the files
            print 'started the fine step = ', i
            suffix = '%04d' %i
            #need to create input file suffix that is one less for 
            suffix_in =  '%04d' %(i - 1)
            out_suffix = '%04d' %n_converge + '.' +  '%04d' %i
            # need to convert the coarse spec (updated) to a fine spec
            # but only for 2nd and higher times slices and only for 
            # first iteration
            fine_in = 'fine_in.' + suffix_in + '.ps'
            fine_out = 'fine_out.' + suffix + '.ps'
            print 'in file = ', fine_in
            print 'out file = ', fine_out
            if i != 1 and n_converge == 0:
                coarse_out = 'coarse_out.' + suffix_in + '.ps'
                try:
                    print 'coarse to fine in first iteration'
                    call_list = [c2f_bin, coarse_out, fine_in, '1', '192',
                     '192', '100', '100']
                    print 'call list = ', call_list
                    subprocess.call(call_list)
                except:
                    self.services.exception('coarse to fine failed in fine')
                    raise
            else:
                try:
                    shutil.copy('fine_out.' + suffix_in + '.ps', fine_in)
                except:
                    self.services.exception('fine out to fine in copy failed')
                    raise
            energy_file = 'energy_fine.' + suffix + '.ps'
            print 'fine energy file - ', energy_file
            cmd = cmds + [fine_in, fine_out, energy_file, out_suffix]
            # try new api for task pool
            #fine_taskid = self.services.launch_task(self.NPROC, 
            #  fine_work, fine_bin , *cmd)
            print 'fine command args = \n', cmd
            self.services.add_task('fine_parareal', 'task_' + suffix, self.NPROC, 
              fine_wrkdir, fine_bin , *cmd, logfile = 'fine.' + suffix + 'log')
            #print '0 task is = ', fine_taskid
            #fine_taskid_list.append(fine_taskid)
            #print '1 task is = ', fine_taskid
            #print 'all tasks are = ', fine_taskid_list
            
        #print 'task id list = ', fine_taskid_list
        # submit the tasks
        num_tasks = self.services.submit_tasks('fine_parareal')
        print 'tasks = ', num_tasks
        task_return = self.services.get_finished_tasks('fine_parareal')
        print 'tasks return ', task_return
        #wait for all of the fine steps to finish
        #retval = self.services.wait_tasklist(fine_taskid_list)
        #failure = False
        #for key, value in retval.items():
        #    print 'task id = ', key, 'return code = ', value
        #    if value != 0:
        #        failure = True
        #        print 'failure in fine task ', key, 'code = ', value
        #if failure == True:  raise Exception 
        try:
            self.services.update_plasma_state()
        except  Exception:
            self.services.exception('update state failed in fine')
            raise
      # try:
      #     self.services.stage_output_files(timeStamp, self.OUTPUT_FILES)
      # except  Exception:
      #     self.services.exception('stage output files  failed in fine')
      #     raise
        old_files = glob.glob('*.ps')
        for o_file in old_files:
            os.remove(o_file)
        return
    
    def finalize(self, timeStamp=0.0):
        return
    
