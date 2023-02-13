#!/bin/bash
export LFS=/mnt/lfs

mkdir -pv $LFS
mount -v -t ext4 "$PART"3 $LFS
/sbin/swapon -v "$PART"2