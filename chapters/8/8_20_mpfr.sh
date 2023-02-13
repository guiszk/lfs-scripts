#!/bin/bash

cd /sources

tar -xvf mpfr*.tar.xz
cd mpfr*/

./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.1.0

time make # 0m55.582s
time make html # 0m2.084s

time make check # 1m53.975s

time make install # 0m0.566s
time make install-html # 0m0.196s

cd ../
rm -rf mpfr*/