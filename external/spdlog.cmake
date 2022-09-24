include(ExternalProject)

ExternalProject_Add(spdlog
    GIT_REPOSITORY https://github.com/gabime/spdlog.git
    GIT_TAG v1.9.2
    CMAKE_ARGS
        -DCMAKE_INSTALL_LIBDIR=lib64
        -DCMAKE_CXX_STANDARD=14
        -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/external/spdlog
    INSTALL_DIR ${CMAKE_BINARY_DIR}/external/spdlog
    BUILD_COMMAND make -j 8)

ExternalProject_Get_property(spdlog INSTALL_DIR)
set(SPDLOG_INCLUDE_DIR ${INSTALL_DIR}/include)
set(SPDLOG_LIBRARY_DIR ${INSTALL_DIR}/lib64)

message("-- SPDLOG_INCLUDE_DIR = ${SPDLOG_INCLUDE_DIR}")
message("-- SPDLOG_LIBRARY_DIR = ${SPDLOG_LIBRARY_DIR}")
