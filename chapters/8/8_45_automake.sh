#!/bin/bash

cd /sources

tar -xvf automake*.tar.xz
cd automake*/

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5

time make # 0m1.238s
time make -j4 check # 28m53.100s
time make install # 0m0.438s

cd ../
rm -rf automake*/
