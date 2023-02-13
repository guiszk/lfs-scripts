#!/bin/bash

cd /sources

tar -zxvf make*.tar.gz
cd make*/

./configure --prefix=/usr

time make # 0m9.777s
time make check # 0m43.970s
time make install # 0m0.462s

cd ../
rm -rf make*/
