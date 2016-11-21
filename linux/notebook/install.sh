#!/bin/bash
add-apt-repository -y ppa:obsproject/obs-studio
apt-get update
apt-get -y install obs-studio

wget "http://download.teamviewer.com/download/teamviewer_i386.deb"
dpkg -i teamviewer_i386.deb || {  apt-get -f -y install; dpkg -i teamviewer_i386.deb; }

# synergy after startup
echo -e "\n\ndisplay-setup-script=/usr/bin/synergyc IP_serveru" >> /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
