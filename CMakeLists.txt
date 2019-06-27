cmake_minimum_required(VERSION 3.3.2)
project(mp1-zybo-nn)

# Environment setup
set(CMAKE_CXX_STANDARD 11)
set(OpenCV_DIR $ENV{OPENCV_PATH})
set(N2D2_DIR $ENV{N2D2_PATH})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/bin")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake/modules/")

message("the dir is ${N2D2_DIR} ")
# N2D2 lib declaration
add_library(ln2d2 SHARED IMPORTED)
set_target_properties(ln2d2 PROPERTIES IMPORTED_LOCATION ${N2D2_DIR}/build/lib/libn2d2_lib.a)

# Executable declaration
add_executable(n2d2_imexp n2d2_imexp.cpp)

# Target dependencies
target_link_libraries(n2d2_imexp -Wl,--whole-archive ln2d2 ${ARGN} -Wl,--no-whole-archive)
target_include_directories(n2d2_imexp PUBLIC "${N2D2_DIR}/include")

find_package(OpenCV REQUIRED)
target_link_libraries(n2d2_imexp ${OpenCV_LIBS})
target_include_directories(n2d2_imexp PUBLIC ${OpenCV_INCLUDE_DIRS})

find_package(Threads REQUIRED)
target_link_libraries(n2d2_imexp Threads::Threads)

find_package(Gnuplot REQUIRED)

find_package(OpenMP QUIET)
if(OpenMP_FOUND)
    target_compile_options(n2d2_imexp PUBLIC ${OpenMP_CXX_FLAGS})
    target_link_libraries(n2d2_imexp ${OpenMP_CXX_FLAGS})
    target_compile_definitions(n2d2_imexp PUBLIC OPENMP=1)
endif()


find_package(PugiXML QUIET)
if(PUGIXML_FOUND)
    target_include_directories(n2d2_imexp PUBLIC ${PUGIXML_INCLUDE_DIR})
    target_link_libraries(n2d2_imexp ${PUGIXML_LIBRARY})
    target_compile_definitions(n2d2_imexp PUBLIC PUGIXML=1)
endif()

find_package(JsonCpp REQUIRED)
if(JsonCpp_FOUND)
    target_include_directories(n2d2_imexp PUBLIC ${JsonCpp_INCLUDE_DIR})
    target_link_libraries(n2d2_imexp ${JsonCpp_LIBRARY})
    target_compile_definitions(n2d2_imexp PUBLIC JSONCPP=1)
endif()

find_package(MongoDB QUIET)
if (MongoDB_FOUND)
    find_package(Boost REQUIRED COMPONENTS filesystem program_options system thread)
    target_link_libraries(n2d2_imexp ${Boost_LIBRARIES})

    find_package(OpenSSL REQUIRED)
    target_link_libraries(n2d2_imexp ${OPENSSL_LIBRARIES})

    target_include_directories(n2d2_imexp PUBLIC ${MongoDB_INCLUDE_DIR})
    target_link_libraries(n2d2_imexp ${MongoDB_LIBRARIES})
    target_compile_definitions(n2d2_imexp PUBLIC MONGODB=1)
endif()
