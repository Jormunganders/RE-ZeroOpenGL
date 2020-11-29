cmake_minimum_required(VERSION 3.17)
project(OpenGLDemo)

# 比较垃圾的写法，macbook -> 2.2.0 版本, 否则 -> 2.1.0 版本
function(config_glew isMacbook)
    message(STATUS "Param ${isMacbook}")
    if (isMacbook)
        message(STATUS "MacBook")
        set(GLEW_H /usr/local/Cellar/glew/2.2.0/include/GL)
        set(GLEW_LINK /usr/local/Cellar/glew/2.2.0/lib/libGLEW.2.2.dylib)
    else()
        message(STATUS "Mac Mini")
        set(GLEW_H /usr/local/Cellar/glew/2.1.0_1/include/GL)
        set(GLEW_LINK /usr/local/Cellar/glew/2.1.0_1/lib/libGLEW.2.1.dylib)
    endif ()
endfunction(config_glew)

set(CMAKE_CXX_STANDARD 14)

include(config.cmake)

config_glew(${IS_MACBOOK})

#设置一些OpenGL头文件所在目录的宏
set(GLFW_H /usr/local/Cellar/glfw/3.3.2/include/GLFW)
set(GLAD_H /usr/local/include)
set(KH_H /usr/local/include/KHR)
#包含上述头文件所在目录
include_directories(${GLEW_H} ${GLFW_H} ${GLAD_H} ${KH_H})

#设置OpenGL库所在位置，并链接
set(GLFW_LINK /usr/local/Cellar/glfw/3.3.2/lib/libglfw.3.3.dylib)
link_libraries(${OPENGL} ${GLEW_LINK} ${GLFW_LINK})

add_subdirectory(glm)

#设置要编译的c/cpp文件到可执行文件中，该exe包含两个文件glad.c,main.cpp
set(SOURCE_FILES "src/glad.c" "main.cpp" src/shader.hpp src/stb_image.h src/stb_image.cpp)

add_executable(OpenGLDemo ${SOURCE_FILES})

#find_library(glm)

if (APPLE)
    target_link_libraries(OpenGLDemo "-framework OpenGL")
    target_link_libraries(OpenGLDemo "-framework GLUT")
endif ()

#target_link_libraries(OpenGLDemo glm)