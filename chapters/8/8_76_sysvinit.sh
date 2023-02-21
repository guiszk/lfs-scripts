#!/bin/bash

cd /sources

tar -xvf sysvinit*.tar.xz
cd sysvinit*/

patch -Np1 -i ../sysvinit-3.04-consolidated-1.patch

time make # 0m3.198s
time make install # 0m0.161s

cd ../
rm -rf sysvinit*/
