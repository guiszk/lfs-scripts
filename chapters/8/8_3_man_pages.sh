#!/bin/bash

cd /sources

tar -xvf man-pages*.tar.xz 
cd man-pages*/

make prefix=/usr install

cd ../
rm -rf man-pages*/