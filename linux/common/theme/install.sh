#!/bin/bash
unzip Numix\ Flat\ Dark.zip -d /usr/share/themes/
cd /usr/share/software-center/ui/gtk3/css;
sed -i 's/@define-color light-aubergine #DED7DB;/@define-color light-aubergine #333333;/' softwarecenter.css;
sed -i 's/@define-color super-light-aubergine #F4F1F3;/@define-color super-light-aubergine #333333;/' softwarecenter.css
#cp -f ~/_installlightdm-tk-greeter.css /usr/share/themes/Greybird/gtk-3.0/apps/
cd /usr/share/themes/Greybird/gtk-3.0/;
sed -i 's/@define-color lightdm_bg_color #f9f9f9;/@define-color lightdm_bg_color #242424;/' gtk.css;
sed -i 's/@define-color lightdm_fg_color #3c3c3c;/@define-color lightdm_fg_color #efefef;/' gtk.css;
sed -i "s/^theme-name=Ambiance/theme-name=Numix Flat Dark/"  /etc/lightdm/lightdm-gtk-greeter-ubuntu.conf
sed -i "s/^theme-name=Greybird/theme-name=Numix Flat Dark/"  /etc/lightdm/lightdm-gtk-greeter.conf