#!/bin/bash

# exit chroot before backup
exit

export LFS=/mnt/lfs

umount $LFS/dev/pts
umount $LFS/{sys,proc,run,dev}

cd $LFS
export SAVEDIR=/home/ubuntu
tar -cJpf $SAVEDIR/lfs-temp-tools-11.2.tar.xz .