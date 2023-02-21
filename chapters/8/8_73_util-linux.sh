#!/bin/bash

cd /sources

tar -xvf util-linux*.tar.xz
cd util-linux*/

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --bindir=/usr/bin    \
            --libdir=/usr/lib    \
            --sbindir=/usr/sbin  \
            --docdir=/usr/share/doc/util-linux-2.38.1 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            --without-systemd    \
            --without-systemdsystemunitdir
    
time make # 2m7.984s

chown -Rv tester .
su tester -c "make -k check"

time make install # 0m5.481s

cd ../
rm -rf util-linux*/
