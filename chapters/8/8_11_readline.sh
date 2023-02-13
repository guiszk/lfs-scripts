#!/bin/bash

cd /sources

tar -zxvf readline*.tar.gz    
cd readline*/

sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.1.2

time make SHLIB_LIBS="-lncursesw" # 0m11.503s
make SHLIB_LIBS="-lncursesw" install 

install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.1.2

cd ../
rm -rf readline*/