#!/usr/bin/env bash

[[ -s $(command -v dragon) ]] || $(_verbose_notify "binary dragon not found" && return)

alias drag='dragon -x -T -i '
