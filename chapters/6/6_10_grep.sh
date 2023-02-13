#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf grep*.tar.xz 
cd grep*/

./configure --prefix=/usr   \
            --host=$LFS_TGT

time make # 0m15.027s
time make DESTDIR=$LFS install # 0m0.984s

cd ../
rm -rf grep*/