#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf xz*.tar.xz 
cd xz*/

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.6

time make # 0m23.098s
time make DESTDIR=$LFS install # 0m1.930s

rm -v $LFS/usr/lib/liblzma.la

cd ../
rm -rf xz*/