#!/bin/bash

cd /sources

tar -xvf patch*.tar.xz
cd patch*/

./configure --prefix=/usr

time make # 0m11.716s
time make check # 0m3.578s
time make install # 0m0.396s

cd ../
rm -rf patch*/
