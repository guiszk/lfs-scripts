#!/bin/bash

cd /sources

tar -zxvf expat*.tar.gz
cd expat*/

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.4.8

time make # 0m9.300s
time make check # 0m11.626s
time make install # 0m0.433s

install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.4.8

cd ../
rm -rf expat*/
