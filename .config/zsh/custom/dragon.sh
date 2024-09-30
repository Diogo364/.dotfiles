#!/usr/bin/env bash

if ! [[ -s $(command -v dragon) ]]; then
    _verbose_notify "binary dragon not found"
    return
fi

alias drag='dragon -x -T -i '
