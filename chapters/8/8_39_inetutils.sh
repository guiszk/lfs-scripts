#!/bin/bash

cd /sources

tar -xvf inetutils*.tar.xz
cd inetutils*/

./configure --prefix=/usr        \
            --bindir=/usr/bin    \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers

time make # 0m24.420s
time make check # 0m1.827s
time make install # 0m1.563s

mv -v /usr/{,s}bin/ifconfig

cd ../
rm -rf inetutils*/
