cmake_minimum_required(VERSION 3.17)
project(OpenGLDemo)

set(CMAKE_CXX_STANDARD 14)

#设置一些OpenGL头文件所在目录的宏
set(GLEW_H /usr/local/Cellar/glew/2.2.0/include/GL)
set(GLFW_H /usr/local/Cellar/glfw/3.3.2/include/GLFW)
set(GLAD_H /usr/local/include)
set(KH_H /usr/local/include/KHR)
#包含上述头文件所在目录
include_directories(${GLEW_H} ${GLFW_H} ${GLAD_H} ${KH_H})

#设置OpenGL库所在位置，并链接
set(GLEW_LINK /usr/local/Cellar/glew/2.2.0/lib/libGLEW.2.2.dylib)
set(GLFW_LINK /usr/local/Cellar/glfw/3.3.2/lib/libglfw.3.3.dylib)
link_libraries(${OPENGL} ${GLEW_LINK} ${GLFW_LINK})

#设置要编译的c/cpp文件到可执行文件中，该exe包含两个文件glad.c,main.cpp,生成SmartPointTest
set(SOURCE_FILES "src/glad.c" "main.cpp" src/shader.hpp)

add_executable(OpenGLDemo ${SOURCE_FILES})

if (APPLE)
    target_link_libraries(OpenGLDemo "-framework OpenGL")
    target_link_libraries(OpenGLDemo "-framework GLUT")
endif()