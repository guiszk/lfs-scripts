#!/bin/bash

cd /sources

tar -xvf lfs-bootscripts*.tar.xz    
cd lfs-bootscripts*/

time make install # 0m0.137s

cd ../
rm -rf lfs-bootscripts*/