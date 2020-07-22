#!/bin/sh

#------------------------------------------------------------------#
#                          INSTALL i3BUNTU                         #
#------------------------------------------------------------------#


###### Update to the last package lists
apt update # To get the latest package lists

###### Install main apps, drivers and dependencies
# apt install -y ubuntu-restricted-extras
apt install -y ubuntu-drivers-common mesa-utils mesa-utils-extra gnupg numlockx xautolock xorg xserver-xorg 
apt install -y openssh-client
apt install -y pavucontrol
apt install -y vim vim-common
apt install -y feh 
# gnome-icon-theme-full
apt install -y rofi compton
apt install -y git
apt install -y i3 i3-wm i3blocks i3lock i3status
apt install -y cups cups-bsd cups-client cups-filters
apt install -y foomatic-db-compressed-ppds
apt install -y openprinting-ppds
apt install -y bluez
apt install -y bluez-cups
apt install -y evince evince-common
apt install -y libssh-4 libnm-glib-vpn1
apt install -y fonts-arphic-ukai fonts-arphic-uming
apt install -y fonts-dejavu-core fonts-freefont-ttf
apt install -y fonts-guru fonts-guru-extra fonts-kacst
apt install -y fonts-kacst-one fonts-khmeros-core
apt install -y fonts-liberation fonts-opensymbol
apt install -y fonts-nanum fonts-stix fonts-symbola
apt install -y xfonts-base xfonts-encodings
apt install -y xfonts-scalable xfonts-utils
apt install -y libxfont1 libfont-afm-perl
apt install -y libfontconfig1 libfontembed1
apt install -y libfontenc1 gnome-font-viewer
apt install -y fontconfig fontconfig-config
apt install -y dmz-cursor-theme libwayland-cursor0
apt install -y libxcursor1 xcursor-themes
apt install -y laptop-detect
apt install -y update-inetd update-notifier
apt install -y update-notifier-common
apt install -y usb-creator-common usb-creator-gtk
# apt install -y gnome-power-manager
apt install -y unrar
apt install -y axel
apt install -y whois
apt install -y xclip
apt install -y gparted
apt install -y cheese
apt install -y fonts-font-awesome
apt install -y snap
apt install -y autocutsel
apt install -y htop
apt install -y doublecmd-gtk
apt install -y rxvt-unicode
apt install -y fish
apt install -y python-dev
apt install -y python3-pip
apt install -y virtualenv
apt install -y meld
apt install -y git-crypt
apt install -y fzf
apt install -y firefox
# Polybar dependency
apt install -y cmake
apt install -y cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev \
  libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev \
  libxcb-util0-dev libxcb-xkb-dev pkg-config python3-xcbgen \
  xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev \
  libiw-dev libcurl4-openssl-dev libpulse-dev \
  libxcb-composite0-dev xcb libxcb-ewmh2
apt install -y docker.io
apt install -y fonts-noto
apt install -y lxappearance
apt install -y wireguard
apt install -y bluetooth blueman 
apt install -y iftop nethogs
apt install -y xfce4-screenshooter
apt install -y ifupdown net-tools
apt install -y libnotify-bin

sudo usermod -aG docker $USER

touch ~/todo

mkdir ~/.fonts

###### Get and install San Francisco Font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf ~/.fonts
rm -rf YosemiteSanFranciscoFont

###### Get and install Font Awesome Web Font
git clone https://github.com/FortAwesome/Font-Awesome.git
cp -v Font-Awesome/fonts/*.ttf ~/.fonts
rm -rf Font-Awesome

cp ./Pictures ~/
cp ./bin/ ~/
cp ./dots/ ~/

# ###### Set appropriate user permissions
chown $(whoami):$(whoami) -R /home/$(whoami)/
chmod g+s /home/$(whoami)/
setfacl -d -m g::rwx /home/$(whoami)/
setfacl -d -m o::rx /home/$(whoami)/

apt update && sudo apt install -y apt-transport-https

# sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

apt update
apt install -y sublime-text
apt install -y yarn
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common


# snap install telegram-desktop
# snap install slack --classic
# snap install goland --classic
# snap install spotify
# snap install dbeaver-ce --edge

mkdir ~/apps
cd ~/apps
curl -L https://get.oh-my.fish | fish
apt-get install microcode.ctl intel-microcode

cd ~/apps
git clone git://github.com/wting/autojump.git
cd autojump
./install.py

cd ~/apps
git clone https://github.com/bigH/git-fuzzy.git

cd ~/apps
git clone https://github.com/jaagr/polybar.git
cd polybar && ./build.sh

systemctl enable multi-user.target --force
systemctl set-default multi-user.target

echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf 

sysctl -p
