#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf gzip*.tar.xz 
cd gzip*/

./configure --prefix=/usr --host=$LFS_TGT

time make # 0m8.109s
time make DESTDIR=$LFS install # 0m0.597s

cd ../
rm -rf gzip*/