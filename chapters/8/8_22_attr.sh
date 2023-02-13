#!/bin/bash

cd /sources

tar -zxvf attr*.tar.gz
cd attr*/

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.1

time make # 0m4.102s
time make check # 0m1.866s
time make install # 0m0.522s

cd ../
rm -rf attr*/