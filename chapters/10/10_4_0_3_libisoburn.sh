#!/bin/bash

# RUN IN HOST SYSTEM
#wget https://files.libburnia-project.org/releases/libisoburn-1.5.4.tar.gz --directory-prefix=/mnt/lfs/sources

tar -zxvf libisoburn*.tar.gz
cd libisoburn*/

./configure --prefix=/usr              \
            --disable-static           \
            --enable-pkg-check-modules &&
make

make install

cd ../
rm -rf libisoburn*/