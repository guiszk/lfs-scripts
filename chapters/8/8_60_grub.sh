#!/bin/bash

cd /sources

tar -xvf grub*.tar.xz
cd grub*/

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

time make # 2m35.598s
time make install # 0m2.345s

mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

cd ../
rm -rf grub*/
