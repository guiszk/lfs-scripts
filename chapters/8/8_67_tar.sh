#!/bin/bash

cd /sources

tar -xvf tar*.tar.xz
cd tar*/

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr

time make # 0m32.470s
time make check # 
time make install # 
make -C doc install-html docdir=/usr/share/doc/tar-1.34

cd ../
rm -rf tar*/
