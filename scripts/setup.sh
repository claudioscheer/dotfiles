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
	vim-gtk \
    build-essential \
    speedcrunch \
    obs-studio \
    gimp \
    pdfshuffler \
    ocrmypdf \
    mypaint \
    owncloud-client \
    caffeine \
    guvcview \
    openvpn \
    openjdk-11-jdk \
    gnupg2 \
    pdf-presenter-console \
    ffmpeg \
    audacity \
    htop \
    xclip \
    bat \
    gnuplot \
    rename \
    virt-manager \
    golang \
    mariadb-client \
    postgresql-client \
    clangd \
    clang-format \
    cmake \
    python3-dev

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
wget https://www.torproject.org/dist/torbrowser/9.5.3/tor-browser-linux64-9.5.3_en-US.tar.xz -O tor.tar.xz
tar xf tor.tar.xz
sudo mv tor-browser_en-US /opt/tor-browser
cd /opt/tor-browser
./start-tor-browser.desktop --register-app
cd -

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
    containerd.io \
    docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash

# Rambox CE
wget https://github.com/ramboxapp/community-edition/releases/download/0.7.5/Rambox-0.7.5-linux-amd64.deb -O rambox.deb
sudo dpkg -i rambox.deb
sudo apt -f install -y

# yEd
wget https://www.yworks.com/resources/yed/demo/yEd-3.20.zip -O yEd-3.20.zip
unzip yEd-3.20.zip
sudo mv yed-3.20/ /opt

# adblock
wget https://raw.githubusercontent.com/MattiSG/adblock/master/adblock -O adblock
chmod +x adblock
sudo mv adblock /usr/local/bin/
sudo adblock on

# Final upgrade
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Create symlinks
sudo ln -s /usr/bin/batcat /usr/local/bin/bat

# Copy files
cd ..
cp .gitconfig ~
cp .local/share/applications/pgmodeler.desktop ~/.local/share/applications
cp .local/share/applications/postman.desktop ~/.local/share/applications
cp .local/share/applications/android-studio.desktop ~/.local/share/applications
echo >> ~/.bashrc
cat .bashrc >> ~/.bashrc
source ~/.bashrc
cd -

# Configure Vim
cp .vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c ":CocInstall -sync coc-json coc-python coc-go coc-sh coc-tsserver coc-yaml coc-clangd coc-texlab coc-snippets coc-pairs" -c q -c q
vim -c ":PlugInstall" -c q -c q
cd ~/.vim/plugged/YouCompleteMe
./install.py --all
# setxkbmap -option caps:swapescape # Switch Caps and Esc.

# # Miniconda
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
# sh miniconda.sh

# Settings
sudo update-alternatives --config editor
