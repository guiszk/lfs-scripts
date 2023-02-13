#!/bin/bash

cd /mnt/lfs/sources

# expand all files
#for i in *.tar.xz; do tar -xvf $i; done
#for i in *.tar.gz; do tar -zxvf $i; done

tar -xvf binutils*.tar.xz
cd binutils*/
mkdir -v build
cd build

../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror

time make # 3m44.906s
time make install #0m3.053s

cd ../../
rm -rf binutils*/
