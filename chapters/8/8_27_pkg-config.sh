#!/bin/bash

cd /sources

tar -zxvf pkg-config*.tar.gz
cd pkg-config*/

./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2

time make # 0m42.219s
time make check # 0m2.401s
time make install # 0m0.562s

cd ../
rm -rf pkg-config*/
