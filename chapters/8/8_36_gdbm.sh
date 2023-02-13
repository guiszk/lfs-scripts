#!/bin/bash

cd /sources

tar -zxvf gdbm*.tar.gz
cd gdbm*/

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat

time make # 0m13.283s
time make check # 0m11.912s
time make install # 0m0.951s

cd ../
rm -rf gdbm*/
