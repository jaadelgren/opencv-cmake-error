cmake_minimum_required(VERSION 3.0)

project(opencv_test)
set(OPENCV_VERSION 4.6.0)

find_package(OpenCV ${OPENCV_VERSION}
    PATHS ${CMAKE_CURRENT_LIST_DIR}/install NO_SYSTEM_ENVIRONMENT_PATH)

#message("OpenCV_LIBS: ${OpenCV_LIBS}")
add_executable(main main.cpp)

target_include_directories(main PRIVATE ${OpenCV_INCLUDE_DIRS})
target_link_libraries(main PRIVATE ${OpenCV_LIBS})
