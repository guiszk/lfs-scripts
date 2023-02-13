#!/bin/bash

cd /sources

tar -xvf gettext*.tar.xz
cd gettext*/

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.21

time make # 4m46.153s
time make check # 3m45.352s
time make install # 0m18.249s

chmod -v 0755 /usr/lib/preloadable_libintl.so

cd ../
rm -rf gettext*/
