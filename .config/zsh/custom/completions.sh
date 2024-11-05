#!/usr/bin/env zsh

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
eval "`pip completion --zsh`"
