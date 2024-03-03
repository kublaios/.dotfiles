#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory
setopt nomatch 

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef	# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots) # Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

# FZF 
[ -f $FZFDIR/completion.zsh ] && source $FZFDIR/completion.zsh
[ -f $FZFDIR/key-bindings.zsh ] && source $FZFDIR/key-bindings.zsh
autoload -U compinit
compinit -u

# Edit line in vim (using escape)
autoload edit-command-line; zle -N edit-command-line

bindkey '^[[Z' complete-word # shift-tab
bindkey '^ ' complete-word # ctrl-space
bindkey '^I' autosuggest-accept # tab

eval "$(rbenv init - zsh)"
eval "$(github-copilot-cli alias -- "$0")"
eval "$(zoxide init --cmd cd zsh)"

