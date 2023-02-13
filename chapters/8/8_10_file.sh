#!/bin/bash

cd /sources

tar -zxvf file*.tar.gz    
cd file*/

./configure --prefix=/usr

time make # 0m10.805s
time make check # 0m1.416s
time make install # 0m0.419s

cd ../
rm -rf file*/