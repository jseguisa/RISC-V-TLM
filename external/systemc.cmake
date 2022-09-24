include(ExternalProject)

ExternalProject_Add(systemc
    GIT_REPOSITORY https://github.com/accellera-official/systemc.git
    GIT_TAG 2.3.3
    CMAKE_ARGS
        -DCMAKE_INSTALL_LIBDIR=lib64
        -DCMAKE_CXX_STANDARD=14
        -DBUILD_SHARED_LIBS=OFF
        -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/external/systemc
    INSTALL_DIR ${CMAKE_BINARY_DIR}/external/systemc
    BUILD_COMMAND make -j 8)

ExternalProject_Get_property(systemc INSTALL_DIR)
set(SYSTEMC_INCLUDE_DIR ${INSTALL_DIR}/include)
set(SYSTEMC_LIBRARY_DIR ${INSTALL_DIR}/lib64)

message("-- SYSTEMC_INCLUDE_DIR = ${SYSTEMC_INCLUDE_DIR}")
message("-- SYSTEMC_LIBRARY_DIR = ${SYSTEMC_LIBRARY_DIR}")
