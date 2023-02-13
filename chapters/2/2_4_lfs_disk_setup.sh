#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

umount /mnt/lfs
lsblk
read -p "enter partition name (/dev/sdX): " PART
# export PART=/dev/vda

(
  echo o; # new dos partition table

  echo n; # new partition
  echo ; # primary 
  echo ; # number
  echo ; # sector
  echo +200M; # size
  echo a; # set bootable
  echo t; # change type
  echo ; # number
  echo EF; # EFI

  
  echo n; # new partition
  echo ; # primary
  echo ; # number
  echo ; # sector
  echo +2G; # size
  echo t;
  echo ;
  echo 82;

  echo n; # new partition
  echo ; # primary
  echo ; # number
  echo ; # sector
  echo ; # size

  echo w; # write
) | fdisk $PART

mkfs -v -t ext4 "$PART"3
mkswap "$PART"2

export LFS=/mnt/lfs