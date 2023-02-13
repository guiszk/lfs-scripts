#!/bin/bash

cd /sources

tar -zxvf libpipeline*.tar.gz
cd libpipeline*/

./configure --prefix=/usr

time make # 0m7.053s
time make check # 0m3.756s
time make install # 0m0.550s

cd ../
rm -rf libpipeline*/
