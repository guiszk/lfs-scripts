#!/bin/bash

cd /sources
tar -xvf gettext*.tar.xz 
cd gettext*/

./configure --disable-shared

time make # 4m25.460s
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

cd ../
rm -rf gettext*/