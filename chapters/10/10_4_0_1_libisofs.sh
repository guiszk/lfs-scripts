#!/bin/bash

# RUN IN HOST SYSTEM
#wget https://files.libburnia-project.org/releases/libisofs-1.5.4.tar.gz --directory-prefix=/mnt/lfs/sources

tar -zxvf libisofs*.tar.gz
cd libisofs*/

./configure --prefix=/usr --disable-static &&
make

make install

cd ../
rm -rf libisofs*/