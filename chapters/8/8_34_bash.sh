#!/bin/bash

cd /sources

tar -zxvf bash*.tar.gz
cd bash*/

./configure --prefix=/usr                      \
            --docdir=/usr/share/doc/bash-5.1.16 \
            --without-bash-malloc              \
            --with-installed-readline

time make # 0m45.562s

chown -Rv tester .

su -s /usr/bin/expect tester << EOF
set timeout -1
spawn make tests
expect eof
lassign [wait] _ _ _ value
exit $value
EOF

time make install # 0m5.963s

exec /usr/bin/bash --login

cd ../
rm -rf bash*/
