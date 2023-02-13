#!/bin/bash

cd /sources

tar -xvf shadow*.tar.xz
cd shadow*/

sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;

sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD SHA512:' \
    -e 's:/var/spool/mail:/var/mail:'                 \
    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                \
    -i etc/login.defs

# cracklib support
#sed -i 's:DICTPATH.*:DICTPATH\t/lib/cracklib/pw_dict:' etc/login.defs

touch /usr/bin/passwd
./configure --sysconfdir=/etc \
            --disable-static  \
            --with-group-name-max-length=32

time make # 0m31.686s

time make exec_prefix=/usr install # 0m1.213s
time make -C man install-man # 0m0.114s

# configure
pwconv
grpconv

mkdir -p /etc/default
useradd -D --gid 999

# stop useradd from creating mailbox files
#sed -i '/MAIL/s/yes/no/' /etc/default/useradd

passwd root

cd ../
rm -rf shadow*/