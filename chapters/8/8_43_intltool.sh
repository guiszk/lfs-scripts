#!/bin/bash

cd /sources

tar -zxvf intltool*.tar.gz
cd intltool*/

sed -i 's:\\\${:\\\$\\{:' intltool-update.in

./configure --prefix=/usr

time make # 0m0.091s
time make check # 0m2.505s
time make install # 0m0.139s

install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

cd ../
rm -rf intltool*/
