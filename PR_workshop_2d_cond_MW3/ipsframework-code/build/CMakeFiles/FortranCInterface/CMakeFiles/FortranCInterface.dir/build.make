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
CMAKE_SOURCE_DIR = /usr/share/cmake/Modules/FortranCInterface

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dsamadd/ipsframework-code/build/CMakeFiles/FortranCInterface

# Include any dependencies generated for this target.
include CMakeFiles/FortranCInterface.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/FortranCInterface.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/FortranCInterface.dir/flags.make

CMakeFiles/FortranCInterface.dir/main.F.o: CMakeFiles/FortranCInterface.dir/flags.make
CMakeFiles/FortranCInterface.dir/main.F.o: /usr/share/cmake/Modules/FortranCInterface/main.F
	$(CMAKE_COMMAND) -E cmake_progress_report /home/dsamadd/ipsframework-code/build/CMakeFiles/FortranCInterface/CMakeFiles $(CMAKE_PROGRESS_1)
	@echo "Building Fortran object CMakeFiles/FortranCInterface.dir/main.F.o"
	/usr/local/depot/INTEL/intel/composerxe-2011.1.107/bin/intel64/ifort  $(Fortran_DEFINES) -DCALL_MOD $(Fortran_FLAGS) -c /usr/share/cmake/Modules/FortranCInterface/main.F -o CMakeFiles/FortranCInterface.dir/main.F.o

CMakeFiles/FortranCInterface.dir/main.F.o.requires:
.PHONY : CMakeFiles/FortranCInterface.dir/main.F.o.requires

CMakeFiles/FortranCInterface.dir/main.F.o.provides: CMakeFiles/FortranCInterface.dir/main.F.o.requires
	$(MAKE) -f CMakeFiles/FortranCInterface.dir/build.make CMakeFiles/FortranCInterface.dir/main.F.o.provides.build
.PHONY : CMakeFiles/FortranCInterface.dir/main.F.o.provides

CMakeFiles/FortranCInterface.dir/main.F.o.provides.build: CMakeFiles/FortranCInterface.dir/main.F.o

CMakeFiles/FortranCInterface.dir/call_sub.f.o: CMakeFiles/FortranCInterface.dir/flags.make
CMakeFiles/FortranCInterface.dir/call_sub.f.o: /usr/share/cmake/Modules/FortranCInterface/call_sub.f
	$(CMAKE_COMMAND) -E cmake_progress_report /home/dsamadd/ipsframework-code/build/CMakeFiles/FortranCInterface/CMakeFiles $(CMAKE_PROGRESS_2)
	@echo "Building Fortran object CMakeFiles/FortranCInterface.dir/call_sub.f.o"
	/usr/local/depot/INTEL/intel/composerxe-2011.1.107/bin/intel64/ifort  $(Fortran_DEFINES) $(Fortran_FLAGS) -c /usr/share/cmake/Modules/FortranCInterface/call_sub.f -o CMakeFiles/FortranCInterface.dir/call_sub.f.o

CMakeFiles/FortranCInterface.dir/call_sub.f.o.requires:
.PHONY : CMakeFiles/FortranCInterface.dir/call_sub.f.o.requires

CMakeFiles/FortranCInterface.dir/call_sub.f.o.provides: CMakeFiles/FortranCInterface.dir/call_sub.f.o.requires
	$(MAKE) -f CMakeFiles/FortranCInterface.dir/build.make CMakeFiles/FortranCInterface.dir/call_sub.f.o.provides.build
.PHONY : CMakeFiles/FortranCInterface.dir/call_sub.f.o.provides

CMakeFiles/FortranCInterface.dir/call_sub.f.o.provides.build: CMakeFiles/FortranCInterface.dir/call_sub.f.o

CMakeFiles/FortranCInterface.dir/call_mod.f90.o: CMakeFiles/FortranCInterface.dir/flags.make
CMakeFiles/FortranCInterface.dir/call_mod.f90.o: /usr/share/cmake/Modules/FortranCInterface/call_mod.f90
	$(CMAKE_COMMAND) -E cmake_progress_report /home/dsamadd/ipsframework-code/build/CMakeFiles/FortranCInterface/CMakeFiles $(CMAKE_PROGRESS_3)
	@echo "Building Fortran object CMakeFiles/FortranCInterface.dir/call_mod.f90.o"
	/usr/local/depot/INTEL/intel/composerxe-2011.1.107/bin/intel64/ifort  $(Fortran_DEFINES) $(Fortran_FLAGS) -c /usr/share/cmake/Modules/FortranCInterface/call_mod.f90 -o CMakeFiles/FortranCInterface.dir/call_mod.f90.o

CMakeFiles/FortranCInterface.dir/call_mod.f90.o.requires:
.PHONY : CMakeFiles/FortranCInterface.dir/call_mod.f90.o.requires

CMakeFiles/FortranCInterface.dir/call_mod.f90.o.provides: CMakeFiles/FortranCInterface.dir/call_mod.f90.o.requires
	$(MAKE) -f CMakeFiles/FortranCInterface.dir/build.make CMakeFiles/FortranCInterface.dir/call_mod.f90.o.provides.build
.PHONY : CMakeFiles/FortranCInterface.dir/call_mod.f90.o.provides

CMakeFiles/FortranCInterface.dir/call_mod.f90.o.provides.build: CMakeFiles/FortranCInterface.dir/call_mod.f90.o

# Object files for target FortranCInterface
FortranCInterface_OBJECTS = \
"CMakeFiles/FortranCInterface.dir/main.F.o" \
"CMakeFiles/FortranCInterface.dir/call_sub.f.o" \
"CMakeFiles/FortranCInterface.dir/call_mod.f90.o"

# External object files for target FortranCInterface
FortranCInterface_EXTERNAL_OBJECTS =

FortranCInterface: CMakeFiles/FortranCInterface.dir/main.F.o
FortranCInterface: CMakeFiles/FortranCInterface.dir/call_sub.f.o
FortranCInterface: CMakeFiles/FortranCInterface.dir/call_mod.f90.o
FortranCInterface: CMakeFiles/FortranCInterface.dir/build.make
FortranCInterface: libsymbols.a
FortranCInterface: libmyfort.a
FortranCInterface: CMakeFiles/FortranCInterface.dir/link.txt
	@echo "Linking Fortran executable FortranCInterface"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/FortranCInterface.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/FortranCInterface.dir/build: FortranCInterface
.PHONY : CMakeFiles/FortranCInterface.dir/build

CMakeFiles/FortranCInterface.dir/requires: CMakeFiles/FortranCInterface.dir/main.F.o.requires
CMakeFiles/FortranCInterface.dir/requires: CMakeFiles/FortranCInterface.dir/call_sub.f.o.requires
CMakeFiles/FortranCInterface.dir/requires: CMakeFiles/FortranCInterface.dir/call_mod.f90.o.requires
.PHONY : CMakeFiles/FortranCInterface.dir/requires

CMakeFiles/FortranCInterface.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/FortranCInterface.dir/cmake_clean.cmake
.PHONY : CMakeFiles/FortranCInterface.dir/clean

CMakeFiles/FortranCInterface.dir/depend:
	cd /home/dsamadd/ipsframework-code/build/CMakeFiles/FortranCInterface && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/share/cmake/Modules/FortranCInterface /usr/share/cmake/Modules/FortranCInterface /home/dsamadd/ipsframework-code/build/CMakeFiles/FortranCInterface /home/dsamadd/ipsframework-code/build/CMakeFiles/FortranCInterface /home/dsamadd/ipsframework-code/build/CMakeFiles/FortranCInterface/CMakeFiles/FortranCInterface.dir/DependInfo.cmake
.PHONY : CMakeFiles/FortranCInterface.dir/depend

