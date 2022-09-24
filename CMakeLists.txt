cmake_minimum_required(VERSION 3.0)

project(RISCV_TLM C CXX)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_C_STANDARD 14)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -g3 -Wextra -Wunused-function -Wpedantic")

include(external/systemc.cmake)
include(external/spdlog.cmake)

file(GLOB_RECURSE sources src/*.cpp src/*.cc)
add_executable(${PROJECT_NAME} ${sources})
add_dependencies(${PROJECT_NAME} systemc spdlog)

target_include_directories(${PROJECT_NAME} PRIVATE ${SYSTEMC_INCLUDE_DIR} ${SPDLOG_INCLUDE_DIR} inc)
target_link_directories(${PROJECT_NAME} PRIVATE ${SYSTEMC_LIBRARY_DIR} ${SPDLOG_LIBRARY_DIR})
target_link_libraries(${PROJECT_NAME} -lsystemc -lspdlog)
