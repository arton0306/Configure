cmake_minimum_required(VERSION 2.8)

SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake" "${CMAKE_SOURCE_DIR}/CMake/Packages")

find_package( FANN REQUIRED )
add_executable( train train.cpp )
add_executable( run run.cpp )

target_link_libraries( train ${FANN_LIBRARIES} )
target_link_libraries( run ${FANN_LIBRARIES} )
