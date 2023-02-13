#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf gcc*.tar.xz
cd gcc*/

mkdir -v build
cd build

../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/12.2.0

time make # 1m16.700s
time make DESTDIR=$LFS install # 0m2.864s

rm -v $LFS/usr/lib/lib{stdc++,stdc++fs,supc++}.la

cd ../../
rm -rf gcc*/