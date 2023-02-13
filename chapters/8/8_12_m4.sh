#!/bin/bash

cd /sources

tar -xvf m4*.tar.xz    
cd m4*/

./configure --prefix=/usr

time make # 0m23.775s
time make check # 1m18.970s
time make install # 0m1.233s

cd ../
rm -rf m4*/