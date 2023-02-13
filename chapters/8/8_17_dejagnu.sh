#!/bin/bash

cd /sources

tar -zxvf dejagnu*.tar.gz
cd dejagnu*/

mkdir -v build
cd build

../configure --prefix=/usr

makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi
makeinfo --plaintext       -o doc/dejagnu.txt  ../doc/dejagnu.texi

time make install # 0m0.183s
install -v -dm755  /usr/share/doc/dejagnu-1.6.3
install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.3

time make check # 0m7.335s

cd ../../
rm -rf dejagnu*/
