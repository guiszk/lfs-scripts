#!/bin/bash

logout

umount -v $LFS/dev/pts
umount -v $LFS/dev
umount -v $LFS/run
umount -v $LFS/proc
umount -v $LFS/sys

umount -v $LFS/usr
umount -v $LFS/home
umount -v $LFS

umount -v $LFS

#shutdown -r now