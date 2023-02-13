#!/bin/bash

cd /sources

tar -xvf sed*.tar.xz
cd sed*/

./configure --prefix=/usr

time make # 0m14.415s
time make html # 0m3.019s

chown -Rv tester .
su tester -c "PATH=$PATH make check"

time make install # 0m1.072s
install -d -m755           /usr/share/doc/sed-4.8
install -m644 doc/sed.html /usr/share/doc/sed-4.8

cd ../
rm -rf sed*/
