#!/bin/bash

set -e

TARGET_CONFIG_PATH=~/.config
DOTFILES_ROOT=~/dotfiles
[ -d $TARGET_CONFIG_PATH ] || mkdir -p $TARGET_CONFIG_PATH

cp -r $DOTFILES_ROOT/.config/* $TARGET_CONFIG_PATH

git clone https://github.com/Diogo364/my-nvim.git ~/.config/nvim
