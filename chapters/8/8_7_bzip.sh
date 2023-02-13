#!/bin/bash

cd /sources

tar -zxvf bzip2*.tar.gz    
cd bzip2*/

patch -Np1 -i ../bzip2*.patch

sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile

make -f Makefile-libbz2_so
time make clean
time make # 0m5.178s
time make PREFIX=/usr install # 0m0.108s

cp -av libbz2.so.* /usr/lib
ln -sv libbz2.so.1.0.8 /usr/lib/libbz2.so

cp -v bzip2-shared /usr/bin/bzip2
for i in /usr/bin/{bzcat,bunzip2}; do
  ln -sfv bzip2 $i
done

rm -fv /usr/lib/libbz2.a

cd ../
rm -rf bzip2*/