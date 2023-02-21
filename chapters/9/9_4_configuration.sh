#!/bin/bash

bash /usr/lib/udev/init-net-rules.sh
cat /etc/udev/rules.d/70-persistent-net.rules

# In some cases such as when MAC addresses have been assigned 
# to a network card manually or in a virtual environment such 
# as Qemu or Xen, the network rules file may not have been 
# generated because addresses are not consistently assigned. 
# In these cases, this method cannot be used. 