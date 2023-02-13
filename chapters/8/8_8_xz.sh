#!/bin/bash

cd /sources

tar -xvf xz*.tar.xz    
cd xz*/

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.6

time make # 0m23.751s
time make check # 0m11.443s
time make install # 0m1.583s

cd ../
rm -rf xz*/