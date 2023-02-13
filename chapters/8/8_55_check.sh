#!/bin/bash

cd /sources

tar -zxvf check*.tar.gz
cd check*/

./configure --prefix=/usr --disable-static

time make # 0m14.048s
time make check # 5m55.410s
time make docdir=/usr/share/doc/check-0.15.2 install # 0m0.432s

cd ../
rm -rf check*/
