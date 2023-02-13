#!/bin/bash

cd /sources

tar -zxvf less*.tar.gz
cd less*/

./configure --prefix=/usr --sysconfdir=/etc

time make # 0m7.841s
time make install # 0m0.028s

cd ../
rm -rf less*/
