#!/bin/bash

cd /sources

tar -zxvf groff*.tar.gz
cd groff*/

PAGE=A4 ./configure --prefix=/usr

time make -j1 # 1m27.863s
time make install # 0m1.610s

cd ../
rm -rf groff*/
