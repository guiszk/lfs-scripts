#!/bin/bash

# RUN IN HOST SYSTEM
#wget https://files.libburnia-project.org/releases/libburn-1.5.4.tar.gz --directory-prefix=/mnt/lfs/sources

tar -zxvf libburn*.tar.gz
cd libburn*/

./configure --prefix=/usr --disable-static &&
make

make install

cd ../
rm -rf libburn*/