#!/bin/bash

cd /sources

tar -zxvf mpc*.tar.gz
cd mpc*/

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.2.1

time make # 0m12.228s
time make html # 0m0.924s
time make check # 0m44.342s
time make install # 0m0.354s
time make install-html # 0m0.134s

cd ../
rm -rf mpc*/
