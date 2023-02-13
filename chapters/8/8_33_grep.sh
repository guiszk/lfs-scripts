#!/bin/bash

cd /sources

tar -xvf grep*.tar.xz
cd grep*/

./configure --prefix=/usr

time make # 0m15.801s
time make check # 1m40.342s
time make install # 0m1.070s

cd ../
rm -rf grep*/
