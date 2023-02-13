#!/bin/bash

cd /sources

tar -xvf kmod*.tar.xz
cd kmod*/

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --with-openssl         \
            --with-xz              \
            --with-zstd            \
            --with-zlib

time make # 0m8.596s
time make install # 0m0.500s

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
done

ln -sfv kmod /usr/bin/lsmod

cd ../
rm -rf kmod*/
