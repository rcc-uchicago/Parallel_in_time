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

# Utility rule file for tests-dakota-scripts-stamp.

# Include the progress variables for this target.
include tests/dakota/CMakeFiles/tests-dakota-scripts-stamp.dir/progress.make

tests/dakota/CMakeFiles/tests-dakota-scripts-stamp:
	cd /home/dsamadd/ipsframework-code/build/tests/dakota && ../../../scimake/mklinks.sh txutils-scripts-stamp /home/dsamadd/ipsframework-code/tests/dakota dakota_test_Rosenbrock.ips dakota_test_Rosenbrock.in workstation.conf dakota_test_Rosenbrock.py
	cd /home/dsamadd/ipsframework-code/build/tests/dakota && ../../../scimake/mklinks.sh txutils-scripts-stamp /home/dsamadd/ipsframework-code/tests/dakota dakota_test_Rosenbrock.ips dakota_test_Rosenbrock.in workstation.conf
	cd /home/dsamadd/ipsframework-code/build/tests/dakota && ../../../scimake/mklinks.sh txutils-scripts-stamp /home/dsamadd/ipsframework-code/tests/dakota dakota_test_Rosenbrock.ips dakota_test_Rosenbrock.in workstation.conf test_ips_without_platform.sh

tests-dakota-scripts-stamp: tests/dakota/CMakeFiles/tests-dakota-scripts-stamp
tests-dakota-scripts-stamp: tests/dakota/CMakeFiles/tests-dakota-scripts-stamp.dir/build.make
.PHONY : tests-dakota-scripts-stamp

# Rule to build all files generated by this target.
tests/dakota/CMakeFiles/tests-dakota-scripts-stamp.dir/build: tests-dakota-scripts-stamp
.PHONY : tests/dakota/CMakeFiles/tests-dakota-scripts-stamp.dir/build

tests/dakota/CMakeFiles/tests-dakota-scripts-stamp.dir/clean:
	cd /home/dsamadd/ipsframework-code/build/tests/dakota && $(CMAKE_COMMAND) -P CMakeFiles/tests-dakota-scripts-stamp.dir/cmake_clean.cmake
.PHONY : tests/dakota/CMakeFiles/tests-dakota-scripts-stamp.dir/clean

tests/dakota/CMakeFiles/tests-dakota-scripts-stamp.dir/depend:
	cd /home/dsamadd/ipsframework-code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dsamadd/ipsframework-code /home/dsamadd/ipsframework-code/tests/dakota /home/dsamadd/ipsframework-code/build /home/dsamadd/ipsframework-code/build/tests/dakota /home/dsamadd/ipsframework-code/build/tests/dakota/CMakeFiles/tests-dakota-scripts-stamp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/dakota/CMakeFiles/tests-dakota-scripts-stamp.dir/depend
