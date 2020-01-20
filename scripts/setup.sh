#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install git curl wget keepassxc ca-certificates apt-transport-https uget krdc libreoffice -y

# Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
sh miniconda.sh

# VSCode
wget https://az764295.vo.msecnd.net/stable/26076a4de974ead31f97692a0d32f90d735645c0/code_1.41.1-1576681836_amd64.deb -O vscode.deb
sudo dpkg -i vscode.deb
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

#VMWare
wget https://download3.vmware.com/software/player/file/VMware-Player-15.5.1-15018445.x86_64.bundle -O vmware.bundle
sudo sh vmware.bundle
