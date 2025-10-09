#!/usr/bin/env bash

ZSHRC="${ZDOTDIR}/.zshrc"

export NVIM_LLM_CHAT_MODEL=qwen3:8b
export NVIM_LLM_CODE_MODEL=qwen2.5-coder:7b-instruct

# Aliases
## Browser
alias browser=brave-browser

## Utilities
# alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rz="source ${ZSHRC}"
alias adu='du $(ls -A)'
alias hdu='du .[^.]*'
alias bdu="adu -sh | sort -nr | grep -P '^\d+(,\d+)?G'"
alias dfstorage='df -h | rg "/$"'
alias oclip="xclip -o"
alias yk="yank"
alias dropbox='python $HOME/Documents/Personal/dropbox.py'
alias ykp="yank -p"
alias yks="yank -s"
alias jukit_kitty="kitty --listen-on=unix:@"$(date +%s%N)" -o allow_remote_control=yes"
alias pp='popd'
alias ppd='popd'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

## Neovim
## My-nvim
alias n='nvim'
alias dnvim="nvim --server localhost:${DEVCONTAINER_NVIM_PORT} --remote-ui"
alias tmpnvim='nvim /tmp/something.txt'
alias nzsh="nvim ${ZSHRC}"
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
alias tqfind='tmux new "qfind"'

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

