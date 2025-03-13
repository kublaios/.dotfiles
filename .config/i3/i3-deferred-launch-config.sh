#!/bin/bash

# Wait for the desktop to be ready
sleep 2

# Enable mod tap for caps lock
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'

# Go back to workspace 1
i3-msg workspace 1
