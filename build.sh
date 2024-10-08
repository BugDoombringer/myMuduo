#!/bin/bash

# 使脚本在遇到任何错误时立即退出
set -e

# 如果没有build目录，创建该目录
if [ ! -d `pwd`/build ]; then
    mkdir `pwd`/build
fi

# 清理build目录原有内容
rm -rf `pwd`/build/*

# 进入build目录并运行cmake和make
cd `pwd`/build &&
    cmake .. &&
    make

# 回到项目根目录
cd ..

# 把头文件拷贝到/usr/include/mymuduo
# “! -d” 表示如果目录不存在
if [ ! -d /usr/include/mymuduo ]; then 
    mkdir /usr/include/mymuduo
fi

for header in `ls src/*.h`
do
    cp $header /usr/include/mymuduo
done

#so库拷贝到/usr/lib
cp `pwd`/lib/libmymuduo.so /usr/lib

#更新系统中共享库的缓存
ldconfig