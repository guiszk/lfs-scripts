#!/bin/bash

cd /sources

tar -zxvf openssl*.tar.gz
cd openssl*/

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

time make # 8m30.620s
time make test # 8m1.043s

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
time make MANSUFFIX=ssl install # 3m9.270s

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.5

cp -vfr doc/* /usr/share/doc/openssl-3.0.5

cd ../
rm -rf openssl*/
