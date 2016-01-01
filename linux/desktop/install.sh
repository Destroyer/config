#!/bin/bash
sudo apt-get install cifs-utils
cd /mnt
mkdir files
sudo mount.cifs //IP/folder /mnt/files -o user="username"
ln -s /mnt/files /var/www/html/
