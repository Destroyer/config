#!/bin/bash
apt-get -y install virtualbox-guest-additions-iso
usermod -a -G vboxuser $SUDO_USER
