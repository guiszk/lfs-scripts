#!/bin/bash

cd /sources

tar -zxvf libffi*.tar.gz
cd libffi*/

./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native \
            --disable-exec-static-tramp

time make # 0m2.722s
time make check # 6m20.763s
time make install # 0m0.390s

cd ../
rm -rf libffi*/
