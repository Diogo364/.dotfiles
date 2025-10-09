#!/bin/bash

export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

export CONFIG_PATH=${XDG_CONFIG_HOME}
export NVIM_CONFIG_PATH="${HOME}/.config/nvim"
export TRASH=${HOME}/.local/share/Trash
export DOTFILES_PATH=${HOME}/.dotfiles
export MANPATH="/usr/local/man:${MANPATH}"
export ZDOTDIR="${CONFIG_PATH}/zsh"
export ZSH_PLUGINS="${HOME}/.zsh"
export OBSIDIAN_VAULT="${HOME}/Documents/Personal/my-obsidian"
export PERSONAL_VAULT="${OBSIDIAN_VAULT}/personal"
export WORK_VAULT="${OBSIDIAN_VAULT}/work"

export SHELL=/bin/zsh

export EDITOR=nvim
export LANG=en_US.UTF-8
export DEVCONTAINER_NVIM_PORT=8008

. "$HOME/.cargo/env"
[ -f ~/.profile-custom ] && . ~/.profile-custom
