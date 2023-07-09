#!/bin/bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find  ~/projects -mindepth 1 -maxdepth 2 -type d | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

session=$(basename "$selected" | tr . _)

if [[ -z $TMUX ]]; then
  tmux new-session -d -s $session -x "$(tput cols)" -y "$(tput lines)" -c $selected

  tmux rename-window -t $session:0 "nvim"
  tmux send-keys -t $session:0 "nvim" C-m
  tmux split-window -t $session:0 -v -p 25 -c $selected
  tmux select-pane -t $session:0

  tmux new-window -t $session:1 -n "cmd" -c $selected
  tmux split-window -t $session:1 -v -p 50 -c $selected
  tmux select-pane -t $session:0

  tmux select-window -t $session:0
  tmux attach-session -t $session

  exit 0
fi

if ! tmux has-session -t=$session 2> /dev/null; then
  tmux new-session -d -s $session -x "$(tput cols)" -y "$(tput lines)" -c $selected

  tmux rename-window -t $session:0 "nvim"
  tmux send-keys -t $session:0 "nvim" C-m
  tmux split-window -t $session:0 -v -p 25 -c $selected
  tmux select-pane -t $session:0

  tmux new-window -t $session:1 -n "cmd" -c $selected
  tmux split-window -t $session:1 -v -p 50 -c $selected
  tmux select-pane -t $session:0

  tmux select-window -t $session:0
fi

tmux switch-client -t $session
