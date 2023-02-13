#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -zxvf bash*.tar.gz 
cd bash*/

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc

time make # 0m54.035s
time make DESTDIR=$LFS install # 0m5.796s

ln -sv bash $LFS/bin/sh

cd ../
rm -rf bash*/