#!/bin/sh

#------------------------------------------------------------------#
#                          INSTALL i3BUNTU                         #
#------------------------------------------------------------------#


###### Place the default wallpaper in $HOME directory
cp wallpaper.jpg ~/.wallpaper.jpg

###### Setup Ubuntu main and unofficial repositories as well as
###### other repositories which will simplify further installations
cp -f sources.list ~/.sources.list

###### Update to the last package lists
apt update # To get the latest package lists

###### Install main apps, drivers and dependencies
# apt install -y ubuntu-restricted-extras
apt install -y openssh-client
apt install -y pavucontrol
apt install -y vim vim-common
apt install -y feh gnome-icon-theme-full
apt install -y rofi compton
apt install -y git
apt install -y i3 i3-wm i3blocks i3lock i3status
apt install -y cups cups-bsd cups-client cups-filters
apt install -y foomatic-db-compressed-ppds
apt install -y openprinting-ppds
apt install -y bluez
apt install -y bluez-cups
apt install -y hplip
apt install -y lightdm-gtk-greeter
apt install -y lightdm-gtk-greeter-settings
apt install -y printer-driver-brlaser printer-driver-c2esp
apt install -y printer-driver-foo2zjs
apt install -y printer-driver-gutenprint
apt install -y printer-driver-hpcups
apt install -y printer-driver-min12xxw
apt install -y printer-driver-pnm2ppa
apt install -y printer-driver-postscript-hp
apt install -y printer-driver-ptouch printer-driver-pxljr
apt install -y printer-driver-sag-gdi printer-driver-splix
apt install -y system-config-printer-gnome
apt install -y indicator-printers
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
apt install -y gnome-power-manager
apt install -y caffeine
apt install -y unrar
apt install -y git
apt install -y vlc
apt install -y axel
apt install -y whois
apt install -y docker
apt install -y cherrytree
apt install -y xclip
apt install -y postgres
apt install -y gparted
apt install -y redis
apt install -y redis-tools
apt install -y cheese
apt install -y fonts-font-awesome
apt install -y snap
apt install -y autocutsel
apt install -y htop
apt install -y doublecmd-gtk
apt install -y rxvt-unicode
apt install -y fish
apt install -y python3
apt install -y python-dev
apt install -y python3-pip
apt install -y virtualenv
apt install -y ansible
apt install -y meld
apt install -y git-crypt

##### Get and install infinality (better font rendering)
add-apt-repository ppa:no1wantdthisname/ppa -y
apt update
apt upgrade -y
apt install -y fontconfig-infinality

###### Make .fonts directory if not already available
mkdir ~/.fonts

###### Get and install San Francisco Font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf ~/.fonts
rm -rf YosemiteSanFranciscoFont

###### Get and install Font Awesome Web Font
git clone https://github.com/FortAwesome/Font-Awesome.git
cp -v Font-Awesome/fonts/*.ttf ~/.fonts
rm -rf Font-Awesome

###### Get and install Moka icon theme
add-apt-repository ppa:moka/daily -y
apt update
apt install -y moka-icon-theme

###### Make config directories
mkdir ~/.config
mkdir ~/.config/i3

###### Apply GTK theme, fonts, icon theme, login greeter
###### and i3
cp -r ~/i3buntu/configs/ ~/


###### Set appropriate user permissions
chown $(whoami):$(whoami) -R /home/$(whoami)/
chmod g+s /home/$(whoami)/
setfacl -d -m g::rwx /home/$(whoami)/
setfacl -d -m o::rx /home/$(whoami)/

apt update && sudo apt install -y apt-transport-https

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add 
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

apt update
apt install -y kubectl
apt install -y sublime-text
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

apt install -y docker-ce docker-ce-cli containerd.io

sudo apt install -y cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev

mkdir apps
cd apps
wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
unzip terraform_0.11.13_linux_amd64.zip
ln -s ~/apps/terraform /usr/local/bin/
wget https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64
mv stern_linux_amd64 stern
chmod a+x stern
ln -s ~/apps/stern /usr/local/bin/
git clone https://github.com/ahmetb/kubectx /opt/kubectx
ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
ln -s /opt/kubectx/kubens /usr/local/bin/kubens
mkdir ~/.config/fish/completions/
ln -s /opt/kubectx/completion/kubectx.fish ~/.config/fish/completions/
ln -s /opt/kubectx/completion/kubens.fish ~/.config/fish/completions/


wget https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
tar -xvf go1.12.1.linux-amd64.tar.gz
mv go /usr/local

git clone https://github.com/jaagr/polybar.git
cd polybar && ./build.sh

snap install telegram-desktop
snap install slack --classic
snap install goland --classic
snap install spotify
snap install dbeaver-ce --edge
