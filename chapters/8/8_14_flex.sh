#!/bin/bash

cd /sources

tar -zxvf flex*.tar.gz    
cd flex*/

./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static

time make # 0m17.750s
time make check # 1m11.970s
time make install # 0m0.665s
 
ln -sv flex /usr/bin/lex

cd ../
rm -rf flex*/