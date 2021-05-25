#!/bin/bash
sudo apt install -y \
    git \
    curl \
    wget \
    keepassxc \
    uget \
    krdc \
    libreoffice \
    build-essential \
    speedcrunch \
    obs-studio \
    gimp \
    pdfshuffler \
    ocrmypdf \
    mypaint \
    owncloud-client \
    openvpn \
    openjdk-11-jdk \
    maven \
    pdf-presenter-console \
    ffmpeg \
    audacity \
    htop \
    xclip \
    gnuplot \
    rename \
    clangd \
    clang-format \
    cmake \
    python3-dev \
    tmux \
    iotop \
    sysstat \
    procps \
    coreutils \
    net-tools \
    linux-tools-common \
    linux-tools-generic \
    linux-tools-`uname -r`

# Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt install neovim -y
sudo ln -s /usr/bin/nvim /usr/bin/vim

# Alacritty
sudo add-apt-repository ppa:mmstick76/alacritty -y
sudo apt-get update
sudo apt install alacritty -y

# Syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update
sudo apt install syncthing -y

## DBeaver
#wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O dbeaver.deb
#sudo dpkg -i dbeaver.deb
#sudo apt -f install -y

## pgModeler
#sudo apt install pgmodeler -y

## Postman
#wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
#tar -zxvf postman.tar.gz
#sudo mv Postman /opt/

# Node.js v12.x
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

# Brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# Signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop -y

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.14.0-amd64.deb -O slack.deb
sudo dpkg -i slack.deb
sudo apt -f install -y

# Etcher
wget https://github.com/balena-io/etcher/releases/download/v1.5.116/balena-etcher-electron_1.5.116_amd64.deb -O balena.deb
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
    containerd.io \
    docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Rambox CE
wget https://github.com/ramboxapp/community-edition/releases/download/0.7.7/Rambox-0.7.7-linux-amd64.deb -O rambox.deb
sudo dpkg -i rambox.deb
sudo apt -f install -y

# yEd
wget https://www.yworks.com/resources/yed/demo/yEd-3.21.1_with-JRE15_64-bit_setup.sh -O yed.sh
chmod +x yed.sh
./yed.sh

# adblock
wget https://raw.githubusercontent.com/MattiSG/adblock/master/adblock -O adblock
chmod +x adblock
sudo mv adblock /usr/local/bin/
sudo adblock on

# TexLab
wget https://github.com/latex-lsp/texlab/releases/download/v2.2.2/texlab-x86_64-linux.tar.gz -O texlab.tar.gz
tar -zxvf texlab.tar.gz
sudo mv texlab /usr/local/bin

# ActivityWatch
wget https://github.com/ActivityWatch/activitywatch/releases/download/v0.10.0/activitywatch-v0.10.0-linux-x86_64.zip -O activitywatch.zip
unzip activitywatch.zip
sudo mv activitywatch /opt/activitywatch
sudo ln -s /opt/activitywatch/aw-qt.desktop ~/.local/share/applications/aw-qt.desktop

# Zoom
wget https://cdn.zoom.us/prod/5.6.13632.0328/zoom_amd64.deb -O zoom.deb
sudo dpkg -i zoom.deb
sudo apt -f install -y

# JetBrains Mono font
wget https://download-cf.jetbrains.com/fonts/JetBrainsMono-2.225.zip -O JetBrainsMono.zip
unzip JetBrainsMono.zip
sudo mv fonts/ttf/ /usr/local/share/fonts/jetbrains-mono

# Nextcloud CLI
sudo add-apt-repository ppa:nextcloud-devs/client
sudo apt-get update
sudo apt install nextcloud-client

# Final upgrade
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Configure Neovim
cp -r ../.config ~
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim -c ":PlugInstall" -c q -c q
mkdir ~/.vim/undodir -p

# Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
sh miniconda.sh

# Settings
sudo update-alternatives --config editor
