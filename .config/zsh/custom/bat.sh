#!/usr/bin/env zsh

[[ -s $(command -v bat) ]] || $(_verbose_notify "binary bat not found" && return)

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias bathelp='bat --language=help'

help() {
    "$@" -h 2>&1 | bathelp
}

alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
