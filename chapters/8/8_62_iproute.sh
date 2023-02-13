#!/bin/bash

cd /sources

tar -xvf iproute*.tar.xz
cd iproute*/

sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

time make NETNS_RUN_DIR=/run/netns # 0m45.619s
time make SBINDIR=/usr/sbin install # 0m0.224s

mkdir -pv /usr/share/doc/iproute2-5.19.0
cp -v COPYING README* /usr/share/doc/iproute2-5.19.0

cd ../
rm -rf iproute*/
