#!/bin/bash 

cd /etc/sysconfig/
cat > ifconfig.eth0 << "EOF"
ONBOOT=yes
IFACE=eth0
SERVICE=ipv4-static
IP=192.168.100.300
GATEWAY=192.168.100.1
PREFIX=24
BROADCAST=192.168.100.255
EOF

echo nameserver 192.168.100.1 > /etc/resolv.conf

echo lfs > /etc/hostname

cat > /etc/hosts << "EOF"
# Begin /etc/hosts

127.0.0.1 localhost
127.0.1.1 lfs.local lfs
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF