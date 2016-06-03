#!/bin/sh
# execute with sudo bash install.sh
mkdir -p ~/_install
mkdir -p ~/_apps
cd ~/_install

add-apt-repository -y ppa:danielrichter2007/grub-customizer
add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:numix/ppa
add-apt-repository ppa:neovim-ppa/unstable

apt-get update
apt-get -y upgrade

wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
wget "http://synergy-project.org/files/packages/synergy-v1.7.6-stable-bcb9da8-Linux-x86_64.deb"
wget "https://download.sublimetext.com/sublime-text_build-3114_amd64.deb"
wget "http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-linux.sh" -O netbeans-8.1-linux.sh
wget --trust-server-names "https://www.trillian.im/get/linux/2.0/trillian_2.0.0.7_v5_amd64.deb"
wget "http://installer.jdownloader.org/JD2Setup_x64.sh"

apt-get -y install alien \
oracle-java8-installer \
grub-customizer \
libqtgui4:amd64 libqt4-network libavahi-compat-libdnssd1 \
git \
libaio1 libaio-dev texlive texlive-lang-czechslovak kile texlive-fonts-recommended latex-beamer texlive-pictures texlive-latex-extra okular \
graphviz \
gnuplot \
doxygen doxygen-gui \
htop \
numlockx \
curl \
vim \
nvim \
rlwrap \
redshift \
redshift-gtk \
numix-icon-theme \
vlc \
ffmpeg \
valgrind \
source-highlight


 
dpkg -i google-chrome-stable_current_amd64.deb || {  apt-get -f -y install; dpkg -i google-chrome-stable_current_amd64.deb; }
dpkg -i synergy* || {  apt-get -f -y install; dpkg -i synergy*; }
dpkg -i sublime-text* || {  apt-get -f -y install; dpkg -i sublime-text*; }
dpkg -i trillian_2*  || {  apt-get -f -y install; dpkg -i trillian_2*; }
 
# Numlock fix
# source: https://help.ubuntu.com/community/NumLock
echo -e "\n\ngreeter-setup-script=/usr/bin/numlockx on" >> /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
echo -e "[SeatDefaults]\nallow-guest=false" >> /usr/share/lightdm/lightdm.conf.d/99-no-guest.conf
 
# Remove obsolete apps
apt-get -y purge gmusicbrowser pidgin simple-scan gnome-sudoku gnome-mines xfce4-dict
apt-get clean
apt-get autoclean
apt-get -y autoremove

cd ~/_install
sh netbeans-8.1-linux.sh &
wait
sh JD2Setup_x64.sh &
wait

cd ~/Templates
touch CPP\ file.cpp
touch C\ file.c
touch Bash\ file.bsh
touch SQL\ file.sql
touch Javascript\ file.js
touch PHP\ file.php
touch HTML\ file.html
 
chown -R ${SUDO_USER}:${SUDO_USER} ~/_apps/
chown -R ${SUDO_USER}:${SUDO_USER} ~/Templates/


update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 
update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 
