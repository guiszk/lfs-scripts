#!/bin/bash

cd /sources

tar -zxvf XML-Parser*.tar.gz
cd XML-Parser*/

perl Makefile.PL

time make # 0m3.032s
time make test # 0m1.284s
time make install # 0m0.405s

cd ../
rm -rf XML-Parser*/
