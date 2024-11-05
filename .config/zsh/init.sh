#!/usr/bin/env zsh

export _ZSH_VERBOSE=0

autoload -Uz compinit
compinit

# Source Order
_source_order=(
    ${_ZSH_CONFIG}/functions.sh
    ${_ZSH_CONFIG}/*.sh
    ${_ZSH_CONFIG}/custom/*
)

_already_sourced=(
    "${_ZSH_CONFIG}/$(basename $0)"
)

source_file() {
    [[ $_ZSH_VERBOSE -eq 1 ]] && echo "sourcing $1"
    echo -e "${_already_sourced[@]}" | grep -q "$1" || source "$1" && _already_sourced+="$1"
}

for fn in "${_source_order[@]}"; do
    source_file $fn
done
