# https://github.com/Mach-OS/Machfiles/blob/master/zsh/.zshrc
#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory
setopt nomatch 

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
# zsh_add_completion "esc/conda-zsh-completion" false
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
# bindkey -s '^o' 'ranger^M'
# bindkey -s '^f' 'zi^M'
# bindkey -s '^s' 'ncdu^M'
# bindkey -s '^v' 'nvim\n'
# bindkey -s '^z' 'zi^M'
# bindkey '^[[P' delete-char
# bindkey "^p" up-line-or-beginning-search # Up
# bindkey "^n" down-line-or-beginning-search # Down
# bindkey "^k" up-line-or-beginning-search # Up
# bindkey "^j" down-line-or-beginning-search # Down
# bindkey -r "^u"
# bindkey -r "^d"

# FZF 
# TODO update for mac
[ -f $FZFDIR/completion.zsh ] && source $FZFDIR/completion.zsh
[ -f $FZFDIR/key-bindings.zsh ] && source $FZFDIR/key-bindings.zsh
# export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
autoload -U compinit
compinit -u

# Edit line in vim (using escape)
autoload edit-command-line; zle -N edit-command-line
# (optional) change to ctrl-e
# bindkey '^e' edit-command-line

bindkey '^[[Z' complete-word # shift-tab
bindkey '^ ' complete-word # ctrl-space
bindkey '^I' autosuggest-accept # tab

eval "$(rbenv init - zsh)"

export TOTP_CONFIG=$HOME/Dropbox/keys-settings/.totp-config.json

# Copilot for CLI
eval "$(github-copilot-cli alias -- "$0")"

# JDK
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
cd /Users/kubilay/Developer/kaia-ios/kaia-ios-app

eval "$(zoxide init --cmd cd zsh)"

