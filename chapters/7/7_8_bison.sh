#!/bin/bash

cd /sources
tar -xvf bison*.tar.xz 
cd bison*/

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2

time make # 0m28.575s
time make install # 0m1.908s

cd ../
rm -rf bison*/