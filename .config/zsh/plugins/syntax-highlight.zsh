#!/bin/zsh

CUSTOM_ZSH_PLUGIN=$(setZshPlugin https://github.com/zsh-users/zsh-syntax-highlighting.git)

source $CUSTOM_ZSH_PLUGIN/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[comment]='none'
