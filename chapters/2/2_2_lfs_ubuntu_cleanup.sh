#!/bin/bash

# change root and ubuntu password
#sudo -s
sudo passwd 
sudo passwd ubuntu

# clears 982mb
sudo apt-get remove --purge libreoffice* firefox* thunderbird* 
sudo apt-get clean
sudo apt-get autoremove

sudo apt-get install vim terminator git
