#!/bin/bash

cd /sources

tar -zxvf zstd*.tar.gz    
cd zstd*/

patch -Np1 -i ../zstd-1.5.2-upstream_fixes-1.patch

time make prefix=/usr # 2m6.817s
time make check # 1m47.595s
time make prefix=/usr install # 0m0.493s

rm -v /usr/lib/libzstd.a

cd ../
rm -rf zstd*/