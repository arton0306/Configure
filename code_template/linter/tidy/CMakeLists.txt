cmake_minimum_required(VERSION 3.10)

# set the project name
project(test_tidy)

message("COMPILER: generate compile_commands.json")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# add the executable
add_executable(test_tidy test_tidy.cpp)
