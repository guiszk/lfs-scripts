#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

ln -sf bash /bin/sh

# texinfo is not available on default ubuntu repos 
if uname -a | grep ubuntu; then 
    add-apt-repository universe
    add-apt-repository multiverse
fi

apt-get update
apt-get install -y bison gawk gcc g++ make wget
apt-get install -y texinfo

sudo passwd 
sudo passwd ubuntu

# clears 982mb
apt-get remove --purge libreoffice* firefox* thunderbird* 
apt-get clean
apt-get autoremove

apt-get install -y vim terminator git