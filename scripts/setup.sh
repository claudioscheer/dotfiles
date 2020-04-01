#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install git curl wget keepassxc ca-certificates apt-transport-https uget krdc libreoffice gnucash vim build-essential speedcrunch obs-studio telegram-desktop gimp pdfshuffler -y

# Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
sh miniconda.sh

# VSCode
wget https://az764295.vo.msecnd.net/stable/c47d83b293181d9be64f27ff093689e8e7aed054/code_1.42.1-1581432938_amd64.deb -O code.deb
sudo dpkg -i code.deb
sudo apt -f install

# DBeaver
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O dbeaver.deb
sudo dpkg -i dbeaver.deb
sudo apt -f install

# PostgreSQL 11
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo apt update
sudo apt install postgresql-client-11 -y

# pgModeler
sudo apt install pgmodeler -y

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
tar -zxvf postman.tar.gz
sudo mv Postman /opt/

# Syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update
sudo apt install syncthing -y

# Spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y

# Node.js v12.x
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs

# Brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# Signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop -y

# Turtl
wget https://github.com/turtl/desktop/releases/download/v0.7.2.5/turtl-0.7.2.5-linux64.tar.bz2 -O turtl.tar.bz2
tar -xvjf turtl.tar.bz2
sudo ./turtl-linux64/install.sh

# VMWare
wget https://download3.vmware.com/software/player/file/VMware-Player-15.5.1-15018445.x86_64.bundle -O vmware.bundle
sudo sh vmware.bundle

# Timeshift
sudo add-apt-repository -y ppa:teejee2008/timeshift
sudo apt update
sudo apt install timeshift -y

# Task Coach
sudo add-apt-repository ppa:taskcoach-developers/ppa -y
sudo apt update
sudo apt install taskcoach -y

# draw.io
wget https://github.com/jgraph/drawio-desktop/releases/download/v12.5.3/draw.io-amd64-12.5.3.deb -O draw.io.deb
sudo dpkg -i draw.io.deb

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.3.2-amd64.deb -O slack.deb
sudo dpkg -i slack.deb
sudo apt -f install

# Nativefier
sudo npm install nativefier -g

# WhatsApp Web
nativefier "https://web.whatsapp.com" --inject ../js/whatsapp-nativefier-inject.js
sudo mv WhatsAppWeb-linux-x64/ /opt/WhatsAppWeb

# Tor Browser
wget https://www.torproject.org/dist/torbrowser/9.0.5/tor-browser-linux64-9.0.5_en-US.tar.xz -O tor.tar.xz
tar xf tor.tar.xz
sudo mv tor-browser_en-US /opt/tor-browser
/opt/tor-browser/start-tor-browser.desktop --register-app

# NetBeans
wget http://ftp.unicamp.br/pub/apache/netbeans/netbeans/11.3/netbeans-11.3-bin.zip -O netbeans.zip
unzip netbeans.zip
sudo mv netbeans /opt

# Typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora

# Zotero
wget https://download.zotero.org/client/release/5.0.85/Zotero-5.0.85_linux-x86_64.tar.bz2 -O zotero.tar.bz2
tar -xvjf zotero.tar.bz2
sudo mv Zotero_linux-x86_64/ /opt/zotero
/opt/zotero/set_launcher_icon
ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop

# OCRmyPDF
sudo apt-get install ocrmypdf -y

# Settings
git config --global core.editor "vim"
sudo update-alternatives --config editor
kwriteconfig5 --file kscreenlockerrc --group Greeter --group LnF --group General --key showMediaControls --type bool false

# Vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
