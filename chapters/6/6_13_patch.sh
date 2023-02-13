#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf patch*.tar.xz 
cd patch*/

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

time make # 0m12.492s
time make DESTDIR=$LFS install # 0m0.457s

cd ../
rm -rf patch*/