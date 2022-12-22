#! /usr/bin/env python

from  component import Component
import os
import subprocess
class PararealFine(Component):
    def __init__(self, services, config):
        Component.__init__(self, services, config)
        print 'Created %s' % (self.__class__)

    def init(self, timeStamp=0.0):
        print 'fine init'
#       need to setup individual workdirectories for fine to work in
        fine_wrkdir = self.services.get_working_dir()
        print self.BIN_PATH
        params = self.FINE_PARAMS.split()
        
        I_time_slice = int(params[1])
        #clean out the old slice directories???
        self.dirs = []
        subprocess.call(['touch','fine_out.n.ps'])
        subprocess.call(['touch','coarse_out.n.ps'])
        subprocess.call(['touch','coarse_out_nt.n.ps'])
        for i in range(1, I_time_slice + 1):
            #create a subdirector for fine to execute in
            pad_nu  = 4 - len(str(i))
            suffix = ''
            for i_pad in range(1, pad_nu + 1):
                suffix = str(0) + suffix
            dir = os.path.join(fine_wrkdir,'slice.' + suffix + str(i))
            try:
                os.mkdir(dir)
                print 'try: ', dir
            except:
                print 'except: ', dir
            self.dirs.append(dir)
        self.services.update_plasma_state()
        return

    def step(self, timeStamp=0.0):
        print 'starting fine iteration'
        #get the configuration information
        cmds = self.FINE_PARAMS.split()
        I_time_slice = int(cmds[1])
        print 'time slices = ', I_time_slice
        self.services.stage_plasma_state()
        fine_wrkdir = self.services.get_working_dir()
        #now ready to launch the parallel fine steps
        #for the first step, the loop will be over all slices--
        #the number of converged step will have to be conveyed at 
        #when I start working on the convergence.
        fine_taskid_list = []
        fine_bin = self.FINE_BIN
        # a value of zero  means that nothing has converged 
        # first time through
        N_converge = int(self.services.get_config_param('N_CONV'))
        print 'n_converge = ',N_converge, ' in fine'
        #new api--create a task pool
        try:
            task_pool = self.services.create_task_pool('fine_parareal')
        except Exception:
            pass
        for i in range(N_converge + 1, I_time_slice+1):
            #construct suffix for the work directory
            print 'started the fine step = ', i
            pad_nu  = 4 - len(str(i))
            suffix = ''
            for i_pad in range(1, pad_nu + 1):
                suffix = str(0) + suffix
            suffix = suffix + str(i)
            #need to create input file suffix that is one less for 
            
            pad_nu  = 4 - len(str(i - 1))
            suffix_in = ''
            for i_pad in range(1, pad_nu + 1):
                suffix_in =  suffix_in + str(0)
            suffix_in =  suffix_in + str(i - 1)
            dir = os.path.join(fine_wrkdir,'slice.' + suffix + str(i))
            fine_in = os.path.join(fine_wrkdir, 'coarse_out.' + suffix_in + '.ps')
            print 'input file = ', fine_in
            fine_work = os.path.join(fine_wrkdir, 'slice.' + suffix)
            print 'work dir  = ', fine_work
            fine_plot = os.path.join(fine_wrkdir, 'plot_fine.' + suffix + '.ps')
            print 'plot file - ', fine_plot
            fine_out = os.path.join(fine_wrkdir, 'fine_out.' + suffix + '.ps')
            print 'out file - ', fine_out
            cmd = cmds + [fine_in, fine_out, fine_plot]
            cmd = cmds + [fine_in, plot_fine, fine_out]
            #print 'directory for fine = ', self.dirs[i-1]
            # try new api for task pool
            #fine_taskid = self.services.launch_task(self.NPROC, 
            #  fine_work, fine_bin , *cmd)
            self.services.add_task('fine_parareal', 'task_' + suffix, self.NPROC, 
              fine_work, fine_bin , *cmd, logfile = 'fine.log' + suffix)
            #print '0 task is = ', fine_taskid
            #fine_taskid_list.append(fine_taskid)
            #print '1 task is = ', fine_taskid
            #print 'all tasks are = ', fine_taskid_list
            
        print 'outside the fine loop'
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
        try:
            self.services.stage_output_files(timeStamp, self.OUTPUT_FILES)
        except  Exception:
            self.services.exception('stage output files  failed in fine')
            raise
        return
    
    def finalize(self, timeStamp=0.0):
        return
    
