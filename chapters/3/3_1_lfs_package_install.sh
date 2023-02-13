#!/bin/bash
export LFS=/mnt/lfs

mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

# missing zlib (zlib-1.2.12.tar.xz) and expat (expat-2.4.8.tar.xz)
wget https://www.linuxfromscratch.org/lfs/view/stable/wget-list-sysv
time wget --input-file=wget-list-sysv --continue --directory-prefix=$LFS/sources

# zlib
wget https://www.zlib.net/zlib-1.2.13.tar.gz --directory-prefix=$LFS/sources
# expat
wget https://github.com/libexpat/libexpat/releases/download/R_2_5_0/expat-2.5.0.tar.gz --directory-prefix=$LFS/sources
# elfutils
wget https://sourceware.org/ftp/elfutils/0.187/elfutils-0.187.tar.bz2 --directory-prefix=$LFS/sources
# gzip
wget https://ftp.gnu.org/gnu/gzip/gzip-1.12.tar.xz --directory-prefix=$LFS/sources

wget https://www.linuxfromscratch.org/lfs/view/stable/md5sums
mv md5sums $LFS/sources
pushd $LFS/sources
  md5sum -c md5sums
popd