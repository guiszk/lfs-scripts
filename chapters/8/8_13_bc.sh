#!/bin/bash

cd /sources

tar -xvf bc*.tar.xz    
cd bc*/

CC=gcc ./configure --prefix=/usr -G -O3 -r

time make # 0m6.453s
time make test # 0m6.453s
time make install # 0m6.453s

ln -sv flex /usr/bin/lex

cd ../
rm -rf bc*/