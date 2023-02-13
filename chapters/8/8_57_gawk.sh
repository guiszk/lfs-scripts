#!/bin/bash

cd /sources

tar -xvf gawk*.tar.xz
cd gawk*/

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

time make # 0m33.519s
time make check # 0m25.835s
time make install # 0m1.772s

mkdir -pv /usr/share/doc/gawk-5.1.1
cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.1

cd ../
rm -rf gawk*/
