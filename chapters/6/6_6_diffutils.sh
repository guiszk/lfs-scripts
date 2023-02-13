#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf diffutils*.tar.xz 
cd diffutils*/

./configure --prefix=/usr --host=$LFS_TGT

time make # 0m15.561s
time make DESTDIR=$LFS install # 0m0.854s

cd ../
rm -rf diffutils*/