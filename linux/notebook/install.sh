#!/bin/bash
add-apt-repository -y ppa:obsproject/obs-studio
apt-get update
apt-get -y install obs-studio

wget "http://download.teamviewer.com/download/teamviewer_i386.deb"
wget "http://download.documentfoundation.org/libreoffice/stable/5.3.0/deb/x86_64/LibreOffice_5.3.0_Linux_x86-64_deb.tar.gz"

dpkg -i teamviewer_i386.deb || {  apt-get -f -y install; dpkg -i teamviewer_i386.deb; }
tar xvf LibreOffice_5.3.0_Linux_x86-64_deb.tar.gz
cd LibreOffice_5.3.0.3_Linux_x86-64_deb\DEBS\; dpkg -i *.deb

# synergy after startup
echo -e "\n\ndisplay-setup-script=/usr/bin/synergyc IP_serveru" >> /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
