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

# Include any dependencies generated for this target.
include tests/bin/CMakeFiles/faulty_serial_sleep.dir/depend.make

# Include the progress variables for this target.
include tests/bin/CMakeFiles/faulty_serial_sleep.dir/progress.make

# Include the compile flags for this target's objects.
include tests/bin/CMakeFiles/faulty_serial_sleep.dir/flags.make

tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o: tests/bin/CMakeFiles/faulty_serial_sleep.dir/flags.make
tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o: ../tests/bin/faulty_serial_sleep.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/dsamadd/ipsframework-code/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o"
	cd /home/dsamadd/ipsframework-code/build/tests/bin && /bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o   -c /home/dsamadd/ipsframework-code/tests/bin/faulty_serial_sleep.c

tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.i"
	cd /home/dsamadd/ipsframework-code/build/tests/bin && /bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/dsamadd/ipsframework-code/tests/bin/faulty_serial_sleep.c > CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.i

tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.s"
	cd /home/dsamadd/ipsframework-code/build/tests/bin && /bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/dsamadd/ipsframework-code/tests/bin/faulty_serial_sleep.c -o CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.s

tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o.requires:
.PHONY : tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o.requires

tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o.provides: tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o.requires
	$(MAKE) -f tests/bin/CMakeFiles/faulty_serial_sleep.dir/build.make tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o.provides.build
.PHONY : tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o.provides

tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o.provides.build: tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o

# Object files for target faulty_serial_sleep
faulty_serial_sleep_OBJECTS = \
"CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o"

# External object files for target faulty_serial_sleep
faulty_serial_sleep_EXTERNAL_OBJECTS =

tests/bin/faulty_serial_sleep: tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o
tests/bin/faulty_serial_sleep: tests/bin/CMakeFiles/faulty_serial_sleep.dir/build.make
tests/bin/faulty_serial_sleep: tests/bin/CMakeFiles/faulty_serial_sleep.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable faulty_serial_sleep"
	cd /home/dsamadd/ipsframework-code/build/tests/bin && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/faulty_serial_sleep.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/bin/CMakeFiles/faulty_serial_sleep.dir/build: tests/bin/faulty_serial_sleep
.PHONY : tests/bin/CMakeFiles/faulty_serial_sleep.dir/build

tests/bin/CMakeFiles/faulty_serial_sleep.dir/requires: tests/bin/CMakeFiles/faulty_serial_sleep.dir/faulty_serial_sleep.c.o.requires
.PHONY : tests/bin/CMakeFiles/faulty_serial_sleep.dir/requires

tests/bin/CMakeFiles/faulty_serial_sleep.dir/clean:
	cd /home/dsamadd/ipsframework-code/build/tests/bin && $(CMAKE_COMMAND) -P CMakeFiles/faulty_serial_sleep.dir/cmake_clean.cmake
.PHONY : tests/bin/CMakeFiles/faulty_serial_sleep.dir/clean

tests/bin/CMakeFiles/faulty_serial_sleep.dir/depend:
	cd /home/dsamadd/ipsframework-code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dsamadd/ipsframework-code /home/dsamadd/ipsframework-code/tests/bin /home/dsamadd/ipsframework-code/build /home/dsamadd/ipsframework-code/build/tests/bin /home/dsamadd/ipsframework-code/build/tests/bin/CMakeFiles/faulty_serial_sleep.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/bin/CMakeFiles/faulty_serial_sleep.dir/depend

