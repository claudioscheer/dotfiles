apt-get update
apt-get install -y apt-utils \
    python3-dev \
    python3-pip \
    cmake \
    clangd \
    clang-format \
    openjdk-11-jdk \
    maven \
    build-essential \
    curl \
    software-properties-common \
    wget \
    git \
    tmux \
    xclip \
    zip \
    unzip

pip3 install 'python-language-server[all]' black jupyterlab

curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs
npm install -g yarn
npm install -g typescript typescript-language-server prettier vscode-json-languageserver
yarn global add yaml-language-server

add-apt-repository ppa:neovim-ppa/unstable -y
apt-get install neovim -y
ln -s /usr/bin/nvim /usr/bin/vim

mkdir -p ~/.config/nvim
wget https://raw.githubusercontent.com/claudioscheer/dotfiles/master/.config/nvim/init.vim -O ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless -E +PlugInstall +qall
mkdir ~/.vim/undodir -p

wget https://raw.githubusercontent.com/claudioscheer/dotfiles/master/.tmux.conf -O ~/.tmux.conf

curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
unzip awscliv2.zip
./aws/install

cat >> ~/.bashrc<< EOF
alias ga="git add"
alias gl="git pull"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpf!="git push --force"
alias gsb="git status -sb"
alias gc="git commit -S"
alias gac="ga . && gc"

alias cd2="cd ../.."
alias cd3="cd2 && cd .."
alias cd4="cd3 && cd .."

alias xclip="xclip -sel clip"
alias tb="nc termbin.com 9999"

stty -ixon

export EDITOR="nvim"
export SYSTEMD_EDITOR="nvim"
EOF

# Clean build files.
rm -rf requirements.sh awscliv2.zip aws
