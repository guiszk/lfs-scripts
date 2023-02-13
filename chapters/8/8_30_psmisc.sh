#!/bin/bash

cd /sources

tar -xvf psmisc*.tar.xz
cd psmisc*/

./configure --prefix=/usr

time make # 0m2.724s
time make install # 0m0.538s

cd ../
rm -rf psmisc*/
