#!/bin/bash

cd /sources

tar -xvf elfutils*.tar.bz2
cd elfutils*/

./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy

time make # 2m21.295s
time make check # 1m8.006s
time make -C libelf install # 0m0.234s

install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a

cd ../
rm -rf elfutils*/
