#!/bin/bash

cd /sources

tar -zxvf zlib*.tar.gz    
cd zlib*/

./configure --prefix=/usr

time make # 0m9.287s
time make check # 0m0.082s
time make install # 0m0.239s

rm -fv /usr/lib/libz.a

cd ../
rm -rf zlib*/