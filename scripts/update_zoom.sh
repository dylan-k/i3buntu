#!/bin/bash
#set -

cd /tmp

#kill $(pgrep -f zoom)

wget https://zoom.us/client/latest/zoom_amd64.deb

sudo apt purge --remove -y zoom 
sudo dpkg -i zoom_amd64.deb

sudo apt --fix-broken install

