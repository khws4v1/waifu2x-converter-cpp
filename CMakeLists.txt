cmake_minimum_required(VERSION 2.8)

include(CheckCXXCompilerFlag)
project(waifu2x-converter-cpp CXX)

CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
endif()

set(CMAKE_PREFIX_PATH "opencv-install")
find_package(OpenCV REQUIRED)
include_directories(include ${OpenCV_INCLUDE_DIRS})
add_executable(waifu2x-converter-cpp src/modelHandler.cpp src/main.cpp)
target_link_libraries(waifu2x-converter-cpp ${OpenCV_LIBS})

