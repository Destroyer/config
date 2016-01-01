#!/bin/bash
# Eclipse
# source: https://www.eclipse.org/downloads/
wget http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/mars/1/eclipse-cpp-mars-1-linux-gtk-x86_64.tar.gz
tar -zxvf eclipse-cpp-mars-1-linux-gtk-x86_64.tar.gz
sudo -s
cp -r eclipse* /opt
echo -e "[Desktop Entry]\nName=Eclipse\nType=Application\nExec=eclipse\nTerminal=false\nIcon=eclipse\nComment=Integrated Development Environment\nNoDisplay=false\nCategories=Development;IDE;\nName[en]=Eclipse" > ~/Desktop/eclipse.desktop
desktop-file-install eclipse.desktop
cd /usr/local/bin
ln -s /opt/eclipse/eclipse
cp /opt/eclipse/icon.xpm /usr/share/pixmaps/eclipse.xpm
exit