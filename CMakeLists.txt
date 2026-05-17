cmake_minimum_required(VERSION 3.20)
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/cmake/Toolchain.cmake" CACHE STRING "Toolchain file")
project(dsOS VERSION 0.0.1 LANGUAGES C)
include(cmake/NDS.cmake)
file(GLOB_RECURSE SOURCES src/*.c)

make_nds(TestGame
    SOURCES ${SOURCES}
    INCLUDES include
)