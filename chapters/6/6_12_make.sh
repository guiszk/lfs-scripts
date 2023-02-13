#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -zxvf make*.tar.gz 
cd make*/

./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

time make # 0m9.746s
time make DESTDIR=$LFS install # 0m0.521s

cd ../
rm -rf make*/