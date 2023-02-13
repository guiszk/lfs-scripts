#!/bin/bash

cd /sources

tar -zxvf iana-etc*.tar.gz 
cd iana-etc*/

cp services protocols /etc

cd ../
rm -rf iana-etc*/