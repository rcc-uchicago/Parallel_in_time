#! /usr/bin/env python

from  component import Component
import shutil

class JorekFine(Component):
    def __init__(self, services, config):
        Component.__init__(self, services, config)
        print 'Created %s' % (self.__class__)

    def init(self, timeStamp=0.0):
        print 'Jorek Fine init'
#       need to setup individual workdirectories for fine to work in
        self.working_dir = self.services.get_working_dir()
        self.services.stage_input_files(self.INPUT_FILES)
        iter_num = int(timeStamp)
        slice_num = 0
        suffix = '%04d.%04d' % (iter_num, slice_num)
        start_in_file = 'file_values_start.' + suffix
        delta_in_file = 'file_deltas_start.' + suffix
        shutil.move('file_values_start', start_in_file)
        shutil.move('file_deltas_start', delta_in_file)
        
        restart_out_file = 'file_values_restart.' + suffix
        delta_out_file = 'file_deltas_restart.' + suffix
        plot_file = 'plot_profile.%s.ps' % (suffix)
        
        total_steps = int(self.TOTAL_STEPS)
        step_width = float(self.STEP_WIDTH)
        solver_executable = self.EXECUTABLE
        plot_file = 'plot_profile.%s.ps' % (suffix)
        args = ('%s %s %s %s %s %d %f ' % (start_in_file, 
                                            delta_in_file, restart_out_file, 
                                            delta_out_file, plot_file, 
                                            total_steps, step_width)).split()
        log_file_name = 'log.' + suffix
        task_id = self.services.launch_task(self.NPROC, self.working_dir, solver_executable, *args, \
                                          block=True, logfile=log_file_name, tag = suffix)
        self.services.wait_task(task_id)
        return

    def step(self, timeStamp=0.0):
        iter_num = 0
        slice_num = int(timeStamp)
        suffix = '%04d.%04d' % (iter_num, slice_num)
        prior_slice_suffix = '%04d.%04d' % (iter_num, slice_num  - 1)
        start_in_file = 'file_values_restart.' + prior_slice_suffix
        delta_in_file = 'file_deltas_restart.' + prior_slice_suffix
        
        restart_out_file = 'file_values_restart.' + suffix
        delta_out_file = 'file_deltas_restart.' + suffix
        plot_file = 'plot_profile.%s.ps' % (suffix)
        
        total_steps = int(self.TOTAL_STEPS)
        step_width = float(self.STEP_WIDTH)
        solver_executable = self.EXECUTABLE
        plot_file = 'plot_profile.%s.ps' % (suffix)
        args = ('%s %s %s %s %s %d %f ' % (start_in_file, 
                                            delta_in_file, restart_out_file, 
                                            delta_out_file, plot_file, 
                                            total_steps, step_width)).split()
        log_file_name = 'log.' + suffix
        task_id = self.services.launch_task(self.NPROC, self.working_dir, solver_executable, *args, \
                                          block=True, logfile=log_file_name, tag = suffix)
        self.services.wait_task(task_id)
        return
    
    def finalize(self, timeStamp=0.0):
        return
    
