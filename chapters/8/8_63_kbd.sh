#!/bin/bash

cd /sources

tar -xvf kbd*.tar.xz
cd kbd*/

patch -Np1 -i ../kbd-2.5.1-backspace-1.patch

sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

./configure --prefix=/usr --disable-vlock

time make # 0m25.755s
time make check # 0m1.567s
time make install # 0m1.994s

mkdir -pv /usr/share/doc/kbd-2.5.1
cp -R -v docs/doc/* /usr/share/doc/kbd-2.5.1

cd ../
rm -rf kbd*/
