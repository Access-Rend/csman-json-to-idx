cmake_minimum_required(VERSION 3.18)
project(csman_json_to_idx)
set(CMAKE_CXX_STANDARD 14)

add_subdirectory(imports/jsoncpp)
include_directories(imports/jsoncpp/include)

add_executable(csman_json_to_idx main.cpp)
target_link_libraries(csman_json_to_idx jsoncpp_lib)