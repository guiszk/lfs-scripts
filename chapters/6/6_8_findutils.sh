#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf findutils*.tar.xz 
cd findutils*/

./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)

time make # 0m29.051s
time make DESTDIR=$LFS install # 0m1.845s

cd ../
rm -rf findutils*/