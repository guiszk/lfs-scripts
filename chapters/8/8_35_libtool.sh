#!/bin/bash

cd /sources

tar -xvf libtool*.tar.xz
cd libtool*/

./configure --prefix=/usr

time make # 0m4.032s
time make check # 7m56.273s
time make install # 0m1.018s

rm -fv /usr/lib/libltdl.a

cd ../
rm -rf libtool*/
