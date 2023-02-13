#!/bin/bash

cd /sources

tar -xvf diffutils*.tar.xz
cd diffutils*/

./configure --prefix=/usr

time make # 0m15.926s
time make check # 1m6.791s
time make install # 0m1.053s

cd ../
rm -rf diffutils*/
