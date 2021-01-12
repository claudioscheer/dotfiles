#!/bin/bash

# Python
pip install 'python-language-server[all]'
pip install black

# Java
git clone https://github.com/eclipse/eclipse.jdt.ls.git
sudo mv eclipse.jdt.ls /opt
cd /opt/eclipse.jdt.ls
./mvnw clean verify
chmod +x /media/water/files/Projects/dotfiles/programming-config/java/java-lsp.sh
sudo ln -s /media/water/files/Projects/dotfiles/programming-config/java/java-lsp.sh /usr/local/bin/java-lsp.sh
