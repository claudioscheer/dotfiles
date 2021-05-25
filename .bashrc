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

export GPG_TTY=$(tty)
export CHROME_PATH=/usr/bin/brave-browser-stable
# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$PATH:$HOME/FlutterSDK/flutter/bin
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export EDITOR="nvim"
export SYSTEMD_EDITOR="nvim"
export PATH=~/.npm-global/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-11.1/targets/x86_64-linux/lib
