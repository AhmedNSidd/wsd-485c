# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.13.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.13.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build

# Include any dependencies generated for this target.
include test/CMakeFiles/templated_fixture_test.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/templated_fixture_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/templated_fixture_test.dir/flags.make

test/CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.o: test/CMakeFiles/templated_fixture_test.dir/flags.make
test/CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.o: ../test/templated_fixture_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.o"
	cd /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build/test && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.o -c /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/test/templated_fixture_test.cc

test/CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.i"
	cd /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build/test && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/test/templated_fixture_test.cc > CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.i

test/CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.s"
	cd /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build/test && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/test/templated_fixture_test.cc -o CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.s

# Object files for target templated_fixture_test
templated_fixture_test_OBJECTS = \
"CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.o"

# External object files for target templated_fixture_test
templated_fixture_test_EXTERNAL_OBJECTS =

test/templated_fixture_test: test/CMakeFiles/templated_fixture_test.dir/templated_fixture_test.cc.o
test/templated_fixture_test: test/CMakeFiles/templated_fixture_test.dir/build.make
test/templated_fixture_test: test/liboutput_test_helper.a
test/templated_fixture_test: src/libbenchmark.a
test/templated_fixture_test: test/CMakeFiles/templated_fixture_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable templated_fixture_test"
	cd /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/templated_fixture_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/templated_fixture_test.dir/build: test/templated_fixture_test

.PHONY : test/CMakeFiles/templated_fixture_test.dir/build

test/CMakeFiles/templated_fixture_test.dir/clean:
	cd /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build/test && $(CMAKE_COMMAND) -P CMakeFiles/templated_fixture_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/templated_fixture_test.dir/clean

test/CMakeFiles/templated_fixture_test.dir/depend:
	cd /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/test /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build/test /Users/ahmedsiddiqui/Desktop/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/benchmark/build/test/CMakeFiles/templated_fixture_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/templated_fixture_test.dir/depend

