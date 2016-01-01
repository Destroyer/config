#!/bin/bash
wget "http://download.teamviewer.com/download/teamviewer_i386.deb"
dpkg -i teamviewer_i386.deb || {  apt-get -f -y install; dpkg -i teamviewer_i386.deb; }