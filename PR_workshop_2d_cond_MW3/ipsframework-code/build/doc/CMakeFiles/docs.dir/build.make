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

# Utility rule file for docs.

# Include the progress variables for this target.
include doc/CMakeFiles/docs.dir/progress.make

doc/CMakeFiles/docs:

docs: doc/CMakeFiles/docs
docs: doc/CMakeFiles/docs.dir/build.make
.PHONY : docs

# Rule to build all files generated by this target.
doc/CMakeFiles/docs.dir/build: docs
.PHONY : doc/CMakeFiles/docs.dir/build

doc/CMakeFiles/docs.dir/clean:
	cd /home/dsamadd/ipsframework-code/build/doc && $(CMAKE_COMMAND) -P CMakeFiles/docs.dir/cmake_clean.cmake
.PHONY : doc/CMakeFiles/docs.dir/clean

doc/CMakeFiles/docs.dir/depend:
	cd /home/dsamadd/ipsframework-code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dsamadd/ipsframework-code /home/dsamadd/ipsframework-code/doc /home/dsamadd/ipsframework-code/build /home/dsamadd/ipsframework-code/build/doc /home/dsamadd/ipsframework-code/build/doc/CMakeFiles/docs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/CMakeFiles/docs.dir/depend

