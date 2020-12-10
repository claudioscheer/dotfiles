#!/bin/sh

session="ged"
# tmux kill-session -t $session
session_exists=$(tmux list-sessions | grep $session)

if [ "$session_exists" = "" ]; then
    tmux new-session -d -s $session -x "$(tput cols)" -y "$(tput lines)"

    tmux rename-window -t 0 "api"
    tmux send-keys -t "api" "cd api" C-m "vim -c 'Lex'" C-m
    tmux split-window -v -p 25
    tmux send-keys -t 1 "cd api" C-m
    tmux select-pane -t 1
    tmux split-window -h -p 50
    tmux send-keys -t 2 "cd api" C-m
    tmux select-pane -t 0

    tmux new-window -t $session:1 -n "web"
    tmux send-keys -t "web" "cd web" C-m "vim -c 'Lex'" C-m
    tmux split-window -v -p 25
    tmux send-keys -t 1 "cd web" C-m
    tmux select-pane -t 1
    tmux split-window -h -p 50
    tmux send-keys -t 2 "cd web" C-m "npm start" C-m
    tmux select-pane -t 0

    tmux new-window -t $session:2 -n "desktop"
    tmux send-keys -t "desktop" "cd desktop" C-m "vim -c 'Lex'" C-m
    tmux split-window -v -p 25
    tmux send-keys -t 1 "cd desktop" C-m
    tmux select-pane -t 0
fi

tmux select-window -t $session:0
tmux attach-session -t $session
