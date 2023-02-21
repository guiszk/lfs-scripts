#!/bin/bash

cd /sources

tar -zxvf eudev*.tar.gz
cd eudev*/

./configure --prefix=/usr           \
            --bindir=/usr/sbin      \
            --sysconfdir=/etc       \
            --enable-manpages       \
            --disable-static

time make # 0m26.699s

mkdir -pv /usr/lib/udev/rules.d
mkdir -pv /etc/udev/rules.d

time make check # 0m2.590s
time make install # 0m1.740s

tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install

udevadm hwdb --update

cd ../
rm -rf eudev*/
