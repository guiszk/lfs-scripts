#!/bin/bash

cd /sources

tar -zxvf expect*.tar.gz
cd expect*/

./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include

time make # 0m6.565s
time make test # 0m13.246s
time make install # 0m0.329s

ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib

cd ../
rm -rf expect*/
