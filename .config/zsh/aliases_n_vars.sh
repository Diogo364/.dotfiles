#!/usr/bin/env bash

# ENV VARS
export SHELL=/bin/zsh
export XDG_CONFIG_HOME=${HOME}/.config
export CONFIG_PATH=${XDG_CONFIG_HOME}
export NVIM_CONFIG_PATH="${HOME}/.config/nvim"
export DEVCONTAINER_NVIM_PORT=8008
export TRASH=${HOME}/.local/share/Trash
export DOTFILES_PATH=${HOME}/.dotfiles
export EDITOR=nvim
export LANG=en_US.UTF-8
export MANPATH="/usr/local/man:$MANPATH"

# Aliases
## Browser
alias browser=brave-browser

## Utilities
# alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rz='source ~/.zshrc'
alias hdu='du .[^.]*'
alias dfstorage='df -h | rg "/$"'
alias cclip="xclip -selection clipboard"
alias oclip="xclip -o"
alias dropbox='python $HOME/Documents/Personal/dropbox.py'
alias jukit_kitty="kitty --listen-on=unix:@"$(date +%s%N)" -o allow_remote_control=yes"
alias nconf="qconf nvim"
alias bconf="qconf bat"
alias rconf="qconf -r nvim"
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Python
alias python3=python
alias pip3=pip

## Neovim
alias dnvim="nvim --server localhost:${DEVCONTAINER_NVIM_PORT} --remote-ui"
alias tmpnvim='nvim /tmp/something.txt'
alias nzsh='nvim ~/.zshrc'
alias nn='nvim ~/.config/nvim'

# tmux aliases
alias t='tmux'
alias ta='tmux attach'
alias tc='clear; tmux clear-history; clear'
alias tm='tmux-sessionizer'
alias tmnew='tmux-sessionizer $(new-project)'
alias dotf='tm ~/.dotfiles'
alias conf='tm ~/.config'
alias tnn='tm ~/.config/nvim nvim'
alias tqconf='tmux new "qconf nvim"'

