#!/bin/bash

export LFS=/mnt/lfs
cd /mnt/lfs/sources

tar -xvf glibc*.tar.xz 
cd glibc*/

case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac

patch -Np1 -i ../glibc*-fhs-1.patch

mkdir -v build
cd build

echo "rootsbindir=/usr/sbin" > configparms

../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$LFS/usr/include    \
      libc_cv_slibdir=/usr/lib

time make # 16m23.904s
time make DESTDIR=$LFS install # 1m14.099s
sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd

# sanity check
echo 'int main(){}' | $LFS_TGT-gcc -xc -
readelf -l a.out | grep ld-linux # should output [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]

rm a.out

$LFS/tools/libexec/gcc/$LFS_TGT/12.2.0/install-tools/mkheaders

cd ../../
rm -rf glibc*/