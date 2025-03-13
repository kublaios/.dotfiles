#!/bin/bash
selected=`cat ~/.dotfiles/scripts/data/tmux-cht-languages ~/.dotfiles/scripts/data/tmux-cht-commands | fzf`
if [ -z $selected ]; then
    exit 0
fi

echo "Selected: $selected"
read -p "Query: " query

if grep -qs "$selected" ~/.dotfiles/scripts/data/tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less -R"
fi
