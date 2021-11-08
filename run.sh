#!/bin/sh

#------------------------------------------------------------------#
#                          INSTALL i3BUNTU                         #
#------------------------------------------------------------------#

###### Add PPAs
add-apt-repository ppa:regolith-linux/release

###### Update to the last package lists
sudo apt update && sudo apt-get upgrade --fix-missing # To get the latest package lists

###### Install main apps, drivers and dependencies
apt install -y software-properties-common 
apt install -y apt-transport-https 
apt install -y curl 
apt install -y wget
apt install -y build-essential checkinstall
apt install -y ubuntu-restricted-extras
apt install -y ubuntu-drivers-common mesa-utils mesa-utils-extra gnupg numlockx xautolock xorg xserver-xorg 
apt install -y x-terminal-emulator
apt install -y openssh-client
apt install -y pavucontrol
apt install -y vim vim-common
apt install -y feh 
apt install -y neofetch
apt install -y install redshift
apt install -y x11-xserver-utils
# gnome-icon-theme-full

# Install latest Git & Git Configure
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt -y install git
apt install -y i3-gaps
apt install -y i3status 
apt install -y suckless-tools
apt install -y xfe
apt install -y rxvt-unicode 
apt install -y xsel
apt install -y rofi 
apt install -y xsettingsd 
apt install -y scrot 
apt install -y viewnior
apt install -y cups cups-bsd cups-client cups-filters
apt install -y foomatic-db-compressed-ppds
apt install -y openprinting-ppds
apt install -y bluez
apt install -y bluez-cups
apt install -y libssh-4 libnm-glib-vpn1
apt install -y laptop-detect
apt install -y update-inetd update-notifier
apt install -y update-notifier-common
# apt install -y gnome-power-manager
apt install -y unrar
apt install -y axel
apt install -y whois
apt install -y xclip
apt install -y gparted
apt install -y autocutsel
apt install -y htop
apt install -y rxvt-unicode
apt install -y fzf
apt install -y texlive-latex-extra
apt install -y pandoc
apt install -y zathura calibre scribus manuskript stardict zotero

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# install hugo 
brew install hugo

touch ~/todo

##### Fonts
mkdir ~/.fonts
apt install -y libxfont1 libfont-afm-perl
apt install -y libfontconfig1 libfontembed1
apt install -y libfontenc1 gnome-font-viewer
apt install -y fontconfig fontconfig-config
apt install -y fonts-mplus 
apt install -y fonts-courier-prime
apt install -y fonts-font-awesome
apt install -y fonts-inter
apt install -y texlive-fonts-recommended

###### Get and install San Francisco Font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf ~/.fonts
rm -rf YosemiteSanFranciscoFont

cp ./Pictures ~/
cp ./bin/ ~/
cp ./dots/ ~/

# ###### Set appropriate user permissions
chown $(whoami):$(whoami) -R /home/$(whoami)/
chmod g+s /home/$(whoami)/
setfacl -d -m g::rwx /home/$(whoami)/
setfacl -d -m o::rx /home/$(whoami)/

##### Install Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

##### Install VisualStudio Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

##### Install Obsidian (an advanced markdown editor)
# https://gist.github.com/shaybensasson/3e8e49af92d7e5013fc77da22bd3ae4c

set -euo pipefail
icon_url="https://cdn.discordapp.com/icons/686053708261228577/1361e62fed2fee55c7885103c864e2a8.png"
#dl_url=${1:-}
dl_url=$( curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest  \
    | grep "browser_download_url.*AppImage" | tail -n 1 | cut -d '"' -f 4 )

if [[ -z "$dl_url" ]]; then
	echo "missing download link"
    echo "usage: install-obsidian.sh"
    exit 1
fi
curl --location --output Obsidian.AppImage "$dl_url"
curl --location --output obsidian.png "$icon_url"
sudo mkdir --parents /opt/obsidian/
sudo mv Obsidian.AppImage /opt/obsidian
sudo chmod u+x /opt/obsidian/Obsidian.AppImage
sudo mv obsidian.png /opt/obsidian
sudo ln -s /opt/obsidian/obsidian.png /usr/share/pixmaps
echo "[Desktop Entry]
Type=Application
Name=Obsidian
Exec=/opt/obsidian/Obsidian.AppImage
Icon=obsidian
Terminal=false" > ~/usr/share/applications/obsidian.desktop
update-desktop-database ~/usr/share/applications
echo "obsidian install ok"
apt install nodejs npm
npm install -g obsidian-cli

##### KITscenarist
echo 'deb http://download.opensuse.org/repositories/home:/AndnoVember:/KITScenarist/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:AndnoVember:KITScenarist.list
curl -fsSL https://download.opensuse.org/repositories/home:AndnoVember:KITScenarist/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_AndnoVember_KITScenarist.gpg > /dev/null
sudo apt update
sudo apt install kitscenarist

mkdir ~/apps

cd ~/apps
git clone git://github.com/wting/autojump.git
cd autojump
./install.py

cd ~/apps
git clone https://github.com/bigH/git-fuzzy.git

systemctl enable multi-user.target --force
systemctl set-default multi-user.target

echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf 

sysctl -p


# Force any missing install, autoremove unused package, autoclean, clean update & reboot system
sudo apt -f install 
sudo apt autoremove 
sudo apt -y autoclean 
sudo apt -y clean 
sudo apt update
sudo reboot


# Install handy
# mkdir ~/.private
# cp ./handy.json ~/.private/handy.json
