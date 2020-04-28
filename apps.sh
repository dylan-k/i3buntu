mkdir ~/apps
cd ~/apps
wget https://github.com/balena-io/etcher/releases/download/v1.5.81/balena-etcher-electron-1.5.81-linux-ia32.zip

wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
unzip terraform_0.12.24_linux_amd64.zip
ln -s ~/apps/terraform /usr/local/bin/

wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.2-amd64.deb
wget https://updates.tdesktop.com/tlinux/tsetup.2.1.0.tar.xz
wget https://zoom.us/client/latest/zoom_amd64.deb

snap install spotify
snap install dbeaver-ce --edge

runuser -l efazati -c "wget -O - https://raw.githubusercont    ent.com/laurent22/joplin/master/Joplin_install_and_update.s    h | bash"
ln -s /home/efazati/.joplin/Joplin.AppImage /usr/local/bin/joplin

yarn global add carbon-now-cli

