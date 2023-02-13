#!/bin/bash

cd /sources
tar -xvf texinfo*.tar.xz 
cd texinfo*/

./configure --prefix=/usr

time make # 0m35.002s
time make install # 0m1.725s

cd ../
rm -rf texinfo*/