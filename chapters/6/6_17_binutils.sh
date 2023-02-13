#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf binutils*.tar.xz 
cd binutils*/

sed '6009s/$add_dir//' -i ltmain.sh

mkdir -v build
cd build

../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --enable-gprofng=no        \
    --disable-werror           \
    --enable-64-bit-bfd

time make # 4m43.696s
time make DESTDIR=$LFS install # 0m3.801s

rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.{a,la}

cd ../../
rm -rf binutils*/