#!/usr/bin/env bash

[[ -s $(command -v eza) ]] || $(_verbose_notify "binary eza not found" && return)

# ---- Eza (better ls) -----
alias l="eza --color=always --long --no-filesize --no-time --no-user --no-permissions"
alias ll="eza --color=always --long --git --icons=always --header" 
alias la="eza --color=always -la --git --icons=always --header" 

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
