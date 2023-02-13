#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf sed*.tar.xz 
cd sed*/

./configure --prefix=/usr   \
            --host=$LFS_TGT

time make # 0m13.848s
time make DESTDIR=$LFS install # 0m0.806s

cd ../
rm -rf sed*/