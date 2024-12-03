#!/usr/bin/env bash


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
alias oclip="xclip -o"
alias yk="yank"
alias dropbox='python $HOME/Documents/Personal/dropbox.py'
alias ykp="yank -p"
alias yks="yank -s"
alias jukit_kitty="kitty --listen-on=unix:@"$(date +%s%N)" -o allow_remote_control=yes"
alias nconf="qconf nvim"
alias bconf="qconf bat"
alias rconf="qconf -r nvim"
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Python
alias python3=python
alias pip3=pip

## Neovim
## My-nvim
alias n='nvim'
alias dnvim="nvim --server localhost:${DEVCONTAINER_NVIM_PORT} --remote-ui"
alias tmpnvim='nvim /tmp/something.txt'
alias nzsh='nvim ~/.zshrc'
alias nn="nvim ${NVIM_CONFIG_PATH}"

## lean-nvim
alias lvim='NVIM_APPNAME=lean-nvim nvim'
alias nl="NVIM_APPNAME=lean-nvim nvim ${CONFIG_PATH}/lean-nvim"

# tmux aliases
alias t='tmux'
alias ta='tmux attach'
alias tc='clear; tmux clear-history; clear'
alias tm='tmux-sessionizer'
alias tmnew='tmux-sessionizer $(new-project)'
alias dotf="tm ${DOTFILES_PATH}"
alias conf="tm ${CONFIG_PATH}"
alias tnn="tm ${NVIM_CONFIG_PATH} nvim"
alias tqconf='tmux new "qconf nvim"'

#Git
alias lg='lazygit'
alias gs='git status'
alias gsn='git status -uno'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias ghbr='\
    gh repo list --json nameWithOwner -q ".[].nameWithOwner" | \
    fzf \
        --ansi \
        --preview "GH_FORCE_TTY=1 gh repo view {1}" \
        --preview-window hidden \
        --bind "enter:become(gh repo view {} --web | glow)" \
        --bind="ctrl-v:toggle-preview" \
    '
