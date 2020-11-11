# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/media/water/files/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/media/water/files/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/media/water/files/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/media/water/files/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

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

alias xclip="xclip -selection c"
alias tb="nc termbin.com 9999"

export GPG_TTY=$(tty)
export CHROME_PATH=/usr/bin/brave-browser-stable
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/FlutterSDK/flutter/bin
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export EDITOR="nvim"
export PATH=~/.npm-global/bin:$PATH
export GPG_TTY=$(tty)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-11.1/targets/x86_64-linux/lib
