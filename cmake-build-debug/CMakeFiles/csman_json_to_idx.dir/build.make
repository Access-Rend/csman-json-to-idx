# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/rend/.local/lib/python3.6/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/rend/.local/lib/python3.6/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/d/mywork/csman_json_to_idx

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/d/mywork/csman_json_to_idx/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/csman_json_to_idx.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/csman_json_to_idx.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/csman_json_to_idx.dir/flags.make

CMakeFiles/csman_json_to_idx.dir/main.cpp.o: CMakeFiles/csman_json_to_idx.dir/flags.make
CMakeFiles/csman_json_to_idx.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/mywork/csman_json_to_idx/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/csman_json_to_idx.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/csman_json_to_idx.dir/main.cpp.o -c /mnt/d/mywork/csman_json_to_idx/main.cpp

CMakeFiles/csman_json_to_idx.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/csman_json_to_idx.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/mywork/csman_json_to_idx/main.cpp > CMakeFiles/csman_json_to_idx.dir/main.cpp.i

CMakeFiles/csman_json_to_idx.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/csman_json_to_idx.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/mywork/csman_json_to_idx/main.cpp -o CMakeFiles/csman_json_to_idx.dir/main.cpp.s

# Object files for target csman_json_to_idx
csman_json_to_idx_OBJECTS = \
"CMakeFiles/csman_json_to_idx.dir/main.cpp.o"

# External object files for target csman_json_to_idx
csman_json_to_idx_EXTERNAL_OBJECTS =

bin/csman_json_to_idx: CMakeFiles/csman_json_to_idx.dir/main.cpp.o
bin/csman_json_to_idx: CMakeFiles/csman_json_to_idx.dir/build.make
bin/csman_json_to_idx: lib/libjsoncpp.so.1.9.4
bin/csman_json_to_idx: CMakeFiles/csman_json_to_idx.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/d/mywork/csman_json_to_idx/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/csman_json_to_idx"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/csman_json_to_idx.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/csman_json_to_idx.dir/build: bin/csman_json_to_idx

.PHONY : CMakeFiles/csman_json_to_idx.dir/build

CMakeFiles/csman_json_to_idx.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/csman_json_to_idx.dir/cmake_clean.cmake
.PHONY : CMakeFiles/csman_json_to_idx.dir/clean

CMakeFiles/csman_json_to_idx.dir/depend:
	cd /mnt/d/mywork/csman_json_to_idx/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/d/mywork/csman_json_to_idx /mnt/d/mywork/csman_json_to_idx /mnt/d/mywork/csman_json_to_idx/cmake-build-debug /mnt/d/mywork/csman_json_to_idx/cmake-build-debug /mnt/d/mywork/csman_json_to_idx/cmake-build-debug/CMakeFiles/csman_json_to_idx.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/csman_json_to_idx.dir/depend

