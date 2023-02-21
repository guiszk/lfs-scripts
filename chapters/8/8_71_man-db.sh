#!/bin/bash

cd /sources

tar -xvf man-db*.tar.xz
cd man-db*/

./configure --prefix=/usr                         \
            --docdir=/usr/share/doc/man-db-2.10.2 \
            --sysconfdir=/etc                     \
            --disable-setuid                      \
            --enable-cache-owner=bin              \
            --with-browser=/usr/bin/lynx          \
            --with-vgrind=/usr/bin/vgrind         \
            --with-grap=/usr/bin/grap             \
            --with-systemdtmpfilesdir=            \
            --with-systemdsystemunitdir=

time make # 0m31.969s
time make check # 0m12.689s
time make install # 0m2.354s

cd ../
rm -rf man-db*/
