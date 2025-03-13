#!/bin/bash

# Wait for the desktop to be ready
sleep 2

# Enable mod tap for caps lock
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'
