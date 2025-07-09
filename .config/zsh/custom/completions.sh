#!/usr/bin/env zsh

autoload -Uz compinit && compinit

# Ignore Case in completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Docker completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

