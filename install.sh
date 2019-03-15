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
apt-get update # To get the latest package lists

###### Install main apps, drivers and dependencies
# apt-get install -y ubuntu-restricted-extras
apt-get install -y openssh-client
apt-get install -y pavucontrol
apt-get install -y vim vim-common
apt-get install -y feh gnome-icon-theme-full
apt-get install -y rofi compton
apt-get install -y git
apt-get install -y i3 i3-wm i3blocks i3lock i3status
apt-get install -y cups cups-bsd cups-client cups-filters
apt-get install -y foomatic-db-compressed-ppds
apt-get install -y openprinting-ppds
apt-get install -y bluez
apt-get install -y bluez-cups
apt-get install -y hplip
apt-get install -y lightdm-gtk-greeter
apt-get install -y lightdm-gtk-greeter-settings
apt-get install -y printer-driver-brlaser printer-driver-c2esp
apt-get install -y printer-driver-foo2zjs
apt-get install -y printer-driver-gutenprint
apt-get install -y printer-driver-hpcups
apt-get install -y printer-driver-min12xxw
apt-get install -y printer-driver-pnm2ppa
apt-get install -y printer-driver-postscript-hp
apt-get install -y printer-driver-ptouch printer-driver-pxljr
apt-get install -y printer-driver-sag-gdi printer-driver-splix
apt-get install -y system-config-printer-gnome
apt-get install -y indicator-printers
apt-get install -y evince evince-common
apt-get install -y libssh-4 libnm-glib-vpn1
apt-get install -y fonts-arphic-ukai fonts-arphic-uming
apt-get install -y fonts-dejavu-core fonts-freefont-ttf
apt-get install -y fonts-guru fonts-guru-extra fonts-kacst
apt-get install -y fonts-kacst-one fonts-khmeros-core
apt-get install -y fonts-liberation fonts-opensymbol
apt-get install -y fonts-nanum fonts-stix fonts-symbola
apt-get install -y xfonts-base xfonts-encodings
apt-get install -y xfonts-scalable xfonts-utils
apt-get install -y libxfont1 libfont-afm-perl
apt-get install -y libfontconfig1 libfontembed1
apt-get install -y libfontenc1 gnome-font-viewer
apt-get install -y fontconfig fontconfig-config
apt-get install -y dmz-cursor-theme libwayland-cursor0
apt-get install -y libxcursor1 xcursor-themes
apt-get install -y laptop-detect
apt-get install -y update-inetd update-notifier
apt-get install -y update-notifier-common
apt-get install -y usb-creator-common usb-creator-gtk
apt-get install -y gnome-power-manager
apt-get install -y caffeine
apt-get install -y unrar
apt-get install -y git
apt-get install -y vlc
apt-get install -y axel
apt-get install -y whois
apt-get install -y docker
apt-get install -y cherrytree
apt-get install -y xclip
apt-get install -y postgres
apt-get install -y gparted
apt-get install -y redis
apt-get install -y redis-tools
apt-get install -y cheese
apt-get install -y fonts-font-awesome
apt-get install -y snap
apt-get install -y autocutsel
apt-get install -y htop
apt-get install -y doublecmd-gtk
apt-get install -y rxvt-unicode
apt-get install -y fish
apt-get install -y python3
apt-get install -y python-dev
apt install -y python3-pip
apt install -y virtualenv
apt install -y ansible
apt install -y meld

##### Get and install infinality (better font rendering)
add-apt-repository ppa:no1wantdthisname/ppa -y
apt-get update
apt-get upgrade -y
apt-get install -y fontconfig-infinality

###### Get and install playerctl
wget 'https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb'
dpkg -i playerctl-0.5.0_amd64.deb
rm -rf playerctl-0.5.0_amd64.deb

###### Remove old versions of the Arc theme
rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}

###### Get and install the latest Arc theme
apt-get install -y arc-theme

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
apt-get update
apt-get install -y moka-icon-theme

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

apt-get update && sudo apt-get install -y apt-transport-https

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

apt-get update
apt-get install -y kubectl
apt-get install -y sublime-text
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

apt-get install -y docker-ce docker-ce-cli containerd.io

sudo apt-get install -y cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev

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
