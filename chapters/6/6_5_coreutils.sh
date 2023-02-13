#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf coreutils*.tar.xz 
cd coreutils*/

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime

time make # 1m37.579s
time make DESTDIR=$LFS install # 0m4.274s

mv -v $LFS/usr/bin/chroot $LFS/usr/sbin
mkdir -pv $LFS/usr/share/man/man8
mv -v $LFS/usr/share/man/man1/chroot.1 $LFS/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' $LFS/usr/share/man/man8/chroot.8

cd ../
rm -rf coreutils*/