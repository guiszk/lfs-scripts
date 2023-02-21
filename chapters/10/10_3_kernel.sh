#!/bin/bash

cd /sources
tar -xvf linux*.tar.xz 
cd linux*/

# if you follow the book, libz.so.1 will be a 0-byte file.
# to fix this, i compiled zlib in another x86_64 machine 
# and transfered the file to lfs.

cp /usr/lib/libz.so.1 /usr/lib/libz.so.1.backup
cp ./libz.so.1 /usr/lib/libz.so.1

time make mrproper 

# edit according to https://www.linuxfromscratch.org/lfs/view/stable/chapter10/kernel.html
# enable virtio drivers if running in a vm

#General setup -->
#   [ ] Compile the kernel with warnings as errors [CONFIG_WERROR]
#Device Drivers  --->
#  Graphics support --->
#   Frame buffer Devices --->
#      [*] Support for frame buffer devices ----
#  Generic Driver Options  --->
#   [ ] Support for uevent helper [CONFIG_UEVENT_HELPER]
#   [*] Maintain a devtmpfs filesystem to mount at /dev [CONFIG_DEVTMPFS]
#   [*]   Automount devtmpfs at /dev, after the kernel mounted the rootfs [CONFIG_DEVTMPFS_MOUNT]
#
#Processor type and features --->
#  [*] Support x2apic [CONFIG_X86_X2APIC]
#Memory Management options  --->
#  [ ] Enable userfaultfd() system call [CONFIG_USERFAULTFD]
#Device Drivers --->
#  [*] PCI Support ---> [CONFIG_PCI]
#    [*] Message Signaled Interrupts (MSI and MSI-X) [CONFIG_PCI_MSI]
#  [*] IOMMU Hardware Support ---> [CONFIG_IOMMU_SUPPORT]
#    [*] Support for Interrupt Remapping [CONFIG_IRQ_REMAP]
time make menuconfig 

time make # 37m9.186s
make modules_install # 0m0.462s

# RUN IN HOST SYSTEM
#mount --bind /boot /mnt/lfs/boot

cp -iv arch/x86/boot/bzImage /boot/vmlinuz-5.19.2-lfs-11.2
cp -iv System.map /boot/System.map-5.19.2
cp -iv .config /boot/config-5.19.2

install -d /usr/share/doc/linux-5.19.2
cp -r Documentation/* /usr/share/doc/linux-5.19.2

install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF

cd ../
rm -rf linux*/