#!/bin/bash
sudo apt install -y \
    git \
    curl \
    wget \
    keepassxc \
    uget \
    libreoffice \
    build-essential \
    speedcrunch \
    obs-studio \
    gimp \
    pdfarranger \
    ocrmypdf \
    mypaint \
    openvpn \
    openjdk-11-jdk \
    maven \
    pdf-presenter-console \
    ffmpeg \
    audacity \
    htop \
    xclip \
    rename \
    tmux \
    iotop \
    sysstat \
    procps \
    coreutils \
    net-tools \
    neovim \
    syncthing \
    gnome-keyring \
    fzf \
    trash-cli \
    imagemagick \
    tree

# Neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage
mv squashfs-root /opt/nvim
sudo ln -sf /opt/nvim/AppRun /usr/bin/nvim
sudo ln -sf /opt/nvim/AppRun /usr/bin/vim

# zsh
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# Others
sudo chown water:water /opt

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
tar -zxvf postman.tar.gz
mv Postman /opt/

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# Node.js global
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

# Signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop -y

# Slack
wget https://downloads.slack-edge.com/releases/linux/4.32.122/prod/x64/slack-desktop-4.32.122-amd64.deb -O slack.deb
sudo dpkg -i slack.deb
sudo apt -f install -y

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
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb

# Leapp
curl https://asset.noovolari.com/latest/Leapp_0.17.6_amd64.deb -o leapp.deb
sudo dpkg -i leapp.deb

# Zoom
wget https://cdn.zoom.us/prod/5.14.10.3738/zoom_amd64.deb -O zoom.deb
sudo dpkg -i zoom.deb
sudo apt -f install -y

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y 

# Go
wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz -O go.tar.gz
sudo tar -C /usr/local -xzf go.tar.gz
go install golang.org/x/tools/gopls@latest

# JetBrains Mono font
wget https://download-cf.jetbrains.com/fonts/JetBrainsMono-2.225.zip -O JetBrainsMono.zip
unzip JetBrainsMono.zip
sudo mv fonts/ttf/ /usr/local/share/fonts/jetbrains-mono

# tmux and packer
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# LSP
npm i -g pyright
npm install -g typescript typescript-language-server
sudo apt-get install ripgrep -y
sudo apt install fd-find -y
npm i -g tree-sitter-cli

# Final upgrade
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y

# Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
sh miniconda.sh
