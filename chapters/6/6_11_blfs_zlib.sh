#!/bin/bash

cd /sources
tar -xvf zlib*.tar.gz 
cd zlib*/

./configure --prefix=/usr

time make #
time make check #
time make install #

mv -v /usr/lib/libz.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so

cd ../
rm -rf zlib*/