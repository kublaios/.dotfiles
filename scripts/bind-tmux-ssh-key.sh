#!/bin/bash
if [[ -n $SSH_TTY ]]; then
    tmux unbind-key C-Space;
    tmux set -g prefix C-b;
    tmux bind C-b send-prefix;
else
    tmux display-message "Not a ssh session"
fi
