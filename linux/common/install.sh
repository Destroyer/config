#!/bin/sh
# execute with sudo bash install.sh
mkdir -p ~/_install
mkdir -p ~/_apps
cd ~/_install

add-apt-repository -y ppa:danielrichter2007/grub-customizer
add-apt-repository -y ppa:numix/ppa

apt-get update
apt-get -y upgrade

wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
wget "https://synergy-project.org/files/packages/synergy-v1.8.7-stable-9799e96-Linux-x86_64.deb"
wget "https://download-cf.jetbrains.com/idea/ideaIC-2016.3.4.tar.gz" -O ideaC.tar.gz
wget --trust-server-names "https://go.microsoft.com/fwlink/?LinkID=760868"
wget --trust-server-names "https://www.trillian.im/get/linux/2.0/trillian_2.0.0.7_v5_amd64.deb"
wget "http://installer.jdownloader.org/JD2Setup_x64.sh"

apt -y install alien \
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
neovim \
rlwrap \
redshift \
redshift-gtk \
numix-icon-theme \
vlc \
ffmpeg \
valgrind \
source-highlight \
unrar unace rar unrar p7zip zip unzip p7zip-full p7zip-rar file-roller \
nethogs \
iptraf \
strace \
zsh


sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" 
dpkg -i google-chrome-stable_current_amd64.deb || {  apt-get -f -y install; dpkg -i google-chrome-stable_current_amd64.deb; }
dpkg -i synergy* || {  apt-get -f -y install; dpkg -i synergy*; }
dpkg -i code* || {  apt-get -f -y install; dpkg -i code*; }
dpkg -i trillian_2*  || {  apt-get -f -y install; dpkg -i trillian_2*; }
tar xvf IdeaC.tar.gz -C ~/_apps/

# Numlock fix
# source: https://help.ubuntu.com/community/NumLock
echo -e "\n\ngreeter-setup-script=/usr/bin/numlockx on" >> /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
echo -e "[SeatDefaults]\nallow-guest=false" >> /usr/share/lightdm/lightdm.conf.d/99-no-guest.conf
 
# Remove obsolete apps
apt -y purge gmusicbrowser pidgin simple-scan gnome-sudoku gnome-mines xfce4-dict
apt clean
apt autoclean
apt -y autoremove

cd ~/_install
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
