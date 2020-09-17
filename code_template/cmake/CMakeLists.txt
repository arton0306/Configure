cmake_minimum_required(VERSION 3.10)

# set the project name
project(ArtonTest)

message("COMPILER: generate compile_commands.json")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# add the executable
add_executable(a.out a.cpp)
