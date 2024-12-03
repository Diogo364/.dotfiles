#!/usr/bin/env bash

[[ -s $(command -v zoxide) ]] || $(_verbose_notify "binary zoxide not found" && return)

eval "$(zoxide init zsh)"

fpath+=${ZDOTDIR}/.zsh_functions
