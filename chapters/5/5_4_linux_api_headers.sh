#!/bin/bash

cd /mnt/lfs/sources
tar -xvf linux*.tar.xz
cd linux*/

make mrproper
make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr

cd ..
rm -rf linux*/