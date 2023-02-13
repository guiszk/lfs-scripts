#!/bin/bash

cd /sources
tar -xvf Python*.tar.xz 
cd Python*/

./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

time make # 3m35.268s
time make install # 0m28.517s

cd ../
rm -rf Python*/