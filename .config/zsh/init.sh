#!/usr/bin/env bash

export _ZSH_VERBOSE=0

# Initial Function Import
source "${_ZSH_CONFIG}"/functions.sh

_curr_fn=$(basename $0)
# Default Config
for fn in `find -L $_ZSH_CONFIG -maxdepth 1 -type f`;
do 
    if [[ "$_curr_fn" != $(basename $fn) ]]; then 
        _verbose_notify "sourcing $fn"
        source "${fn}"
    fi
done

# Custom Config
for fn in `find -L $_ZSH_CONFIG -mindepth 2 -type f`;
do 
    if [[ "$_curr_fn" != $(basename $fn) ]]; then 
        _verbose_notify "sourcing $fn"
        source "${fn}"
    fi
done

