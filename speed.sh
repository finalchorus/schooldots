#!/bin/bash

#Disables the built-in GNOME animations
gsettings set org.gnome.desktop.interface enable-animations false

#Enables the built-in GNOME animations
#gsettings set org.gnome.desktop.interface enable-animations true
#====================================================================

#Reduces the color space of the transmitted XRDP session
sudo sed -i 's/max_bpp=32/max_bpp=16/g' /etc/xrdp/xrdp.ini && sudo reboot

#If for any reason you would return to the full colours being transmitted by XRDP :
#sudo sed -i 's/max_bpp=16/max_bpp=32/g' /etc/xrdp/xrdp.ini && sudo reboot
