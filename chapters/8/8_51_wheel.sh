#!/bin/bash

cd /sources

tar -zxvf wheel*.tar.gz
cd wheel*/

time pip3 install --no-index $PWD # 0m1.751s

cd ../
rm -rf wheel*/
