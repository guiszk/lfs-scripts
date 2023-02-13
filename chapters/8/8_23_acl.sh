#!/bin/bash

cd /sources

tar -xvf acl*.tar.xz
cd acl*/

./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/acl-2.3.1

time make # 0m11.186s
time make install # 0m0.551s

cd ../
rm -rf acl*/
