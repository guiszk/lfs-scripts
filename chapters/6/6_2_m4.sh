#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf m4*.tar.xz
cd m4*/

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

time make # 0m24.045s
time make DESTDIR=$LFS install # 0m1.013s

cd ../
rm -rf m4*/