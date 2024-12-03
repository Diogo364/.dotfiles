#!/usr/bin/env zsh

export _ZSH_VERBOSE=${_ZSH_VERBOSE-0}

export fpath=("${ZDOTDIR}/functions" $fpath)
autoload -Uz "${ZDOTDIR}"/functions/*

# Source Order
_source_order=(
	${ZDOTDIR}/*.sh
	${ZDOTDIR}/custom/*
)

_already_sourced=(
	"${ZDOTDIR}/$(basename $0)"
)

source_file() {
	[[ $_ZSH_VERBOSE -eq 1 ]] && echo "sourcing $1"
	echo -e "${_already_sourced[@]}" | grep -q "$1" || source "$1" && _already_sourced+="$1"
}

for fn in "${_source_order[@]}"; do
	source_file $fn
done
