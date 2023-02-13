#!/bin/bash

cd /sources

tar -xvf gzip*.tar.xz
cd gzip*/

./configure --prefix=/usr

time make # 0m8.105s
time make check # 0m33.828s
time make install # 0m0.686s

cd ../
rm -rf gzip*/
