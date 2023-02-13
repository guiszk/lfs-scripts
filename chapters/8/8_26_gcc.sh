#!/bin/bash

cd /sources

tar -xvf gcc*.tar.xz
cd gcc*/

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir -v build
cd build

../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib

time make # 58m27.152s

# increase the stack size
ulimit -s 32768

# test results
chown -Rv tester .
su tester -c "PATH=$PATH make -k check"

../contrib/test_summary
# get only summary
../contrib/test_summary | grep -A7 Summ


time make install # 1m23.647s


# change ownership
chown -v -R root:root \
    /usr/lib/gcc/$(gcc -dumpmachine)/12.2.0/include{,-fixed}

ln -svr /usr/bin/cpp /usr/lib

ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/12.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/


echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'

# should output [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]

grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log

# should output 
#/usr/lib/gcc/x86_64-pc-linux-gnu/12.2.0/../../../../lib/crt1.o succeeded
#/usr/lib/gcc/x86_64-pc-linux-gnu/12.2.0/../../../../lib/crti.o succeeded
#/usr/lib/gcc/x86_64-pc-linux-gnu/12.2.0/../../../../lib/crtn.o succeeded

grep -B4 '^ /usr/include' dummy.log

# should output 
##include <...> search starts here:
# /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.0/include
# /usr/local/include
# /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.0/include-fixed
# /usr/include

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'

# should output 
#SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib64")
#SEARCH_DIR("/usr/local/lib64")
#SEARCH_DIR("/lib64")
#SEARCH_DIR("/usr/lib64")
#SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib")
#SEARCH_DIR("/usr/local/lib")
#SEARCH_DIR("/lib")
#SEARCH_DIR("/usr/lib");

grep "/lib.*/libc.so.6 " dummy.log

# should output attempt to open /usr/lib/libc.so.6 succeeded

grep found dummy.log

# should output found ld-linux-x86-64.so.2 at /usr/lib/ld-linux-x86-64.so.2

rm -v dummy.c a.out dummy.log

mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

cd ../../
rm -rf gcc*/
