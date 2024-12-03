#!/bin/zsh

CUSTOM_ZSH_PLUGIN=$(setZshPlugin https://github.com/zsh-users/zsh-autosuggestions.git)

source $CUSTOM_ZSH_PLUGIN/zsh-autosuggestions.zsh

bindkey -M emacs '^y' autosuggest-accept
bindkey -M vicmd '^y' autosuggest-accept
bindkey -M viins '^y' autosuggest-accept
