#!/usr/bin/env bash

if ! [[ -s $(command -v zoxide) ]]; then
    _verbose_notify "binary zoxide not found"
    return
fi

eval "$(zoxide init zsh)"
# alias cd="z"

fpath+=${ZDOTDIR:-~}/.zsh_functions
