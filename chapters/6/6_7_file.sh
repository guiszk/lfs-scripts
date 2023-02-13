#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -zxvf file*.tar.gz 
cd file*/

mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

time make FILE_COMPILE=$(pwd)/build/src/file # 0m10.713s
time make DESTDIR=$LFS install # 0m0.500s

rm -v $LFS/usr/lib/libmagic.la

cd ../
rm -rf file*/