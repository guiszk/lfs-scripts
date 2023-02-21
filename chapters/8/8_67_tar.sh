#!/bin/bash

cd /sources

tar -xvf tar*.tar.xz
cd tar*/

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr

time make # 0m32.470s
time make check # 12m32.920s
time make install # 0m3.026s
make -C doc install-html docdir=/usr/share/doc/tar-1.34

cd ../
rm -rf tar*/
