cmake_minimum_required(VERSION 2.5)
project(mymuduo)

# 设置动态库的路径为根目录的lib文件夹
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

# 设置调试信息以及启动C++11语言标准
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -std=c++11 -fPIC")

# 添加include目录，以便找到头文件
include_directories(${PROJECT_SOURCE_DIR}/src)

# 定义参与编译的源代码文件 
aux_source_directory(${PROJECT_SOURCE_DIR}/src SRC_LIST)

# 编译生成动态库mymuduo
add_library(mymuduo SHARED ${SRC_LIST})