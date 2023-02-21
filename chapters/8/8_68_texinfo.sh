#!/bin/bash

cd /sources

tar -xvf texinfo*.tar.xz
cd texinfo*/

./configure --prefix=/usr

time make # 0m37.391s
time make check # 1m16.805s
time make install # 0m2.019s
make TEXMF=/usr/share/texmf install-tex

# to recreate /usr/share/info/dir
#pushd /usr/share/info
#  rm -v dir
#  for f in *
#    do install-info $f dir 2>/dev/null
#  done
#popd

cd ../
rm -rf texinfo*/
