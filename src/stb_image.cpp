// 此文件的作用：
// 通过定义 STB_IMAGE_IMPLEMENTATION ，预处理器会修改头文件，
// 让其只包含相关的函数定义源码，相当于是将这个头文件变成一个 .cpp 文件
// Created by Juhezi on 2020/11/26.
//

#define STB_IMAGE_IMPLEMENTATION

#include "stb_image.h"