# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dsamadd/ipsframework-code

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dsamadd/ipsframework-code/build

# Utility rule file for docs-pdf.

# Include the progress variables for this target.
include doc/CMakeFiles/docs-pdf.dir/progress.make

doc/CMakeFiles/docs-pdf: doc/pdf/IntegratedPlasmaSimulatorIPS.pdf

doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/index.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/developer_guides/adv_plasma_state.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/developer_guides/developer_guides.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/developer_guides/porting.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/developer_guides/fwk_and_mgrs.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/developer_guides/ips_design.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/portal_guides/portal_guides.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/intro.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/component_guides/component_guides.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/getting_started/getting_started_new.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/getting_started/getting_started.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/advanced_parallelism.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/examples_listing.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/basic_guide.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/user_guides.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/config_file_new.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/component_guide.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/advanced_guide_new.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/config_file.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/perf_anal.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/advanced_guide.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/api_guide.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/platform.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/plasma_state.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/user_guides/manual_platform.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/pubs.rst
doc/pdf/IntegratedPlasmaSimulatorIPS.pdf: ../doc/the_code.rst
	$(CMAKE_COMMAND) -E cmake_progress_report /home/dsamadd/ipsframework-code/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating pdf/IntegratedPlasmaSimulatorIPS.pdf"
	cd /home/dsamadd/ipsframework-code/build/doc && /usr/local/depot/Python-2.7.5/bin/sphinx-build -D mathjax_path= -d /home/dsamadd/ipsframework-code/build/doc/doctrees -b latex /home/dsamadd/ipsframework-code/doc /home/dsamadd/ipsframework-code/build/doc/pdf && make -C /home/dsamadd/ipsframework-code/build/doc/pdf all-pdf

docs-pdf: doc/CMakeFiles/docs-pdf
docs-pdf: doc/pdf/IntegratedPlasmaSimulatorIPS.pdf
docs-pdf: doc/CMakeFiles/docs-pdf.dir/build.make
.PHONY : docs-pdf

# Rule to build all files generated by this target.
doc/CMakeFiles/docs-pdf.dir/build: docs-pdf
.PHONY : doc/CMakeFiles/docs-pdf.dir/build

doc/CMakeFiles/docs-pdf.dir/clean:
	cd /home/dsamadd/ipsframework-code/build/doc && $(CMAKE_COMMAND) -P CMakeFiles/docs-pdf.dir/cmake_clean.cmake
.PHONY : doc/CMakeFiles/docs-pdf.dir/clean

doc/CMakeFiles/docs-pdf.dir/depend:
	cd /home/dsamadd/ipsframework-code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dsamadd/ipsframework-code /home/dsamadd/ipsframework-code/doc /home/dsamadd/ipsframework-code/build /home/dsamadd/ipsframework-code/build/doc /home/dsamadd/ipsframework-code/build/doc/CMakeFiles/docs-pdf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/CMakeFiles/docs-pdf.dir/depend

