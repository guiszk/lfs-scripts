#!/bin/bash

cd /sources

tar -xvf autoconf*.tar.xz
cd autoconf*/

./configure --prefix=/usr

time make # 0m1.758s
time make check # 27m36.867s
time make install # 0m0.431s

cd ../
rm -rf autoconf*/
