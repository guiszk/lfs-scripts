#!/bin/bash

cd /sources

tar -zxvf gperf*.tar.gz
cd gperf*/

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1

time make # 0m4.183s
time make -j1 check # 0m1.515s
time make install # 0m0.058s

cd ../
rm -rf gperf*/
