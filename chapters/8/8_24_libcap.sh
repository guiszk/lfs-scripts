#!/bin/bash

cd /sources

tar -xvf libcap*.tar.xz
cd libcap*/

sed -i '/install -m.*STA/d' libcap/Makefile

time make prefix=/usr lib=lib # 0m3.374s
time make test # 0m0.658s
time make prefix=/usr lib=lib install # 0m0.551s

cd ../
rm -rf libcap*/
