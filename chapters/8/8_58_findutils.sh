#!/bin/bash

cd /sources

tar -xvf findutils*.tar.xz
cd findutils*/

case $(uname -m) in
    i?86)   TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
    x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
esac

time make # 0m20.906s

chown -Rv tester .
su tester -c "PATH=$PATH make check"

time make install # 0m2.036s

cd ../
rm -rf findutils*/
