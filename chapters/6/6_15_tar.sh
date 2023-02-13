#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf tar*.tar.xz 
cd tar*/

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)

time make # 0m33.512s
time make DESTDIR=$LFS install # 0m1.165s

cd ../
rm -rf tar*/