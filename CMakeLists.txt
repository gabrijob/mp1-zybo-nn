cmake_minimum_required(VERSION 3.3.2)
project(mp1-zybo-nn)

set(OpenCV_DIR home/gabriel/Public/OpenCV/installation/OpenCV-3.4.4/share/OpenCV/)
set(N2D2_DIR home/gabriel/Public/N2D2)

include_directories(${N2D2_DIR}/include)

add_library(ln2d2 SHARED IMPORTED)
set_target_properties(ln2d2 PROPERTIES IMPORTED_LOCATION ${N2D2_DIR}/build/lib/libn2d2_lib.a)

add_executable(mp1-zybo-nn n2d2_imexp.cpp)
target_link_libraries(mp1-zybo-nn ln2d2)
#target_include_directories(mp1-zybo-nn PUBLIC ${N2D2_DIR}/include)

install(TARGETS mp1-zybo-nn DESTINATION bin)


