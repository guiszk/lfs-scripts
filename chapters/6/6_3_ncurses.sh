#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -zxvf ncurses*.tar.gz 
cd ncurses*/

sed -i s/mawk// configure
  
mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd

./configure --prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-normal             \
            --with-cxx-shared            \
            --without-debug              \
            --without-ada                \
            --disable-stripping          \
            --enable-widec

time make # 1m6.493s
time make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install # 0m11.632s
echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so

cd ../
rm -rf ncurses*/