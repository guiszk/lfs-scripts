#!/bin/bash

cd /sources

tar -xvf procps-ng*.tar.xz
cd procps-ng*/

./configure --prefix=/usr                            \
            --docdir=/usr/share/doc/procps-ng-4.0.0 \
            --disable-static                         \
            --disable-kill

time make # 0m17.836s
time make check # 0m7.823s
time make install # 0m1.481s

cd ../
rm -rf procps-ng*/
