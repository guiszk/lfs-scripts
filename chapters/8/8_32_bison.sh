#!/bin/bash

cd /sources

tar -xvf bison*.tar.xz
cd bison*/

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2

time make # 0m30.429s
time make check # 31m38.746s
time make install # 0m2.154s

cd ../
rm -rf bison*/
