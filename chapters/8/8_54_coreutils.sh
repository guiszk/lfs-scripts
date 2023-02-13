#!/bin/bash

cd /sources

tar -xvf coreutils*.tar.xz
cd coreutils*/

patch -Np1 -i ../coreutils*.patch

autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

time make # 1m38.650s
time make NON_ROOT_USERNAME=tester check-root # 0m10.944s

echo "dummy:x:102:tester" >> /etc/group

chown -Rv tester . 
su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"

sed -i '/dummy/d' /etc/group

time make install # 0m3.369s

mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8

cd ../
rm -rf coreutils*/
