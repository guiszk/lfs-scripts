#!/bin/bash

cd /sources

tar -xvf binutils*.tar.xz
cd binutils*/

expect -c "spawn ls" # should output "spawn ls"
mkdir -v build
cd build

../configure --prefix=/usr       \
             --sysconfdir=/etc   \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

time make tooldir=/usr # 18m41.391s
time make -k check # failed
time make tooldir=/usr install # 0m19.486s

rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a

cd ../../
rm -rf binutils*/
