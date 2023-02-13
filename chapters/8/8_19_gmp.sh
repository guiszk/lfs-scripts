#!/bin/bash

cd /sources

tar -xvf gmp*.tar.xz
cd gmp*/

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.1

time make # 1m23.252s
time make html # 0m3.801s

make check 2>&1 | tee gmp-check-log

awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log

time make install # 0m0.852s
time make install-html # 0m0.183s

cd ../
rm -rf gmp*/
