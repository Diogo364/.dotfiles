#!/usr/bin/env bash

if ! [[ -s $(command -v eza) ]]; then
    _verbose_notify "binary eza not found"
    return
fi

# ---- Eza (better ls) -----
alias l="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll="eza --color=always --long --git --icons=always --header" 

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
