#!/bin/bash
# Automatically switch tmux prefix based on whether SSH clients are connected
# Run this periodically or on client attach

# Check if any tmux client is connected via SSH (shows as 'screen' terminal type)
if tmux list-clients 2>/dev/null | grep -q "screen"; then
    # SSH client detected - switch to C-b to avoid conflicts
    current_prefix=$(tmux show-options -g prefix | cut -d' ' -f2)
    if [[ "$current_prefix" != "C-b" ]]; then
        tmux unbind-key C-Space
        tmux set -g prefix C-b
        tmux bind C-b send-prefix
        tmux display-message "SSH client detected - prefix changed to C-b"
    fi
else
    # No SSH clients - use C-Space
    current_prefix=$(tmux show-options -g prefix | cut -d' ' -f2)
    if [[ "$current_prefix" != "C-Space" ]]; then
        tmux unbind-key C-b
        tmux set -g prefix C-Space
        tmux bind C-Space send-prefix
        tmux display-message "Local session - prefix changed to C-Space"
    fi
fi