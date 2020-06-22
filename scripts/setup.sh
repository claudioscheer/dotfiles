#!/bin/bash
sudo apt install -y \
    git \
    curl \
    wget \
    keepassxc \
    ca-certificates \
    apt-transport-https \
    gnupg-agent \
    software-properties-common \
    uget \
    krdc \
    libreoffice \
    vim \
    build-essential \
    speedcrunch \
    obs-studio \
    gimp \
    pdfshuffler \
    ocrmypdf \
    mypaint \
    owncloud-client \
    caffeine \
    guvcview

# Syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update
sudo apt install syncthing -y

# VSCode
wget https://az764295.vo.msecnd.net/stable/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/code_1.46.1-1592428892_amd64.deb -O code.deb
sudo dpkg -i code.deb
sudo apt -f install -y

# DBeaver
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O dbeaver.deb
sudo dpkg -i dbeaver.deb
sudo apt -f install -y

# pgModeler
sudo apt install pgmodeler -y

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
tar -zxvf postman.tar.gz
sudo mv Postman /opt/

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

# draw.io
wget https://github.com/jgraph/drawio-desktop/releases/download/v13.2.4/draw.io-amd64-13.2.4.deb -O draw.io.deb
sudo dpkg -i draw.io.deb

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.3-amd64.deb -O slack.deb
sudo dpkg -i slack.deb
sudo apt -f install -y

# Tor Browser
wget https://www.torproject.org/dist/torbrowser/9.5/tor-browser-linux64-9.5_en-US.tar.xz -O tor.tar.xz
tar xf tor.tar.xz
sudo mv tor-browser_en-US /opt/tor-browser
/opt/tor-browser/start-tor-browser.desktop --register-app

# Typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora -y

# Zotero
wget https://download.zotero.org/client/release/5.0.85/Zotero-5.0.85_linux-x86_64.tar.bz2 -O zotero.tar.bz2
tar -xvjf zotero.tar.bz2
sudo mv Zotero_linux-x86_64/ /opt/zotero
/opt/zotero/set_launcher_icon
ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop

# Etcher
wget https://github.com/balena-io/etcher/releases/download/v1.5.99/balena-etcher-electron_1.5.99_amd64.deb -O balena.deb
sudo dpkg -i balena.deb
sudo apt -f install -y

# VirtualBox
sudo apt install -y \
    virtualbox \
    virtualbox-guest-additions-iso \
    virtualbox-ext-pack

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER

# Final upgrade
sudo apt update
sudo apt upgrade -y

# Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
sh miniconda.sh

# Settings
sudo update-alternatives --config editor