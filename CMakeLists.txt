cmake_minimum_required(VERSION 3.21)

set(CMAKE_MOD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

project(
  cpp-implementations CXX
  DESCRIPTION "A C++ repository consiting of many implementantions of things.."
  LANGUAGES CXX
)

include(${CMAKE_MOD_DIR}/BuildType.cmake)
set_default_build_type()

add_subdirectory(src)
