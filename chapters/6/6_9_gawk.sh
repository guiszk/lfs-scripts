#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf gawk*.tar.xz 
cd gawk*/

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

time make # 0m31.193s
time make DESTDIR=$LFS install # 0m1.717s

cd ../
rm -rf gawk*/