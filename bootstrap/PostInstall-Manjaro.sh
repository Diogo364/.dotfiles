#!/bin/bash

# Custom PACMAN Configuration
PACCONF=/etc/pacman.conf

echo "Updating configurations on $PACCONF"

sudo sed -i -E 's/#?Color/Color/g' $PACCONF
sudo sed -i -E 's/#?ParallelDownloads .*/ParallelDownloads \= 10/g' $PACCONF
sudo sed -i '/Color/aILoveCandy' $PACCONF

# Updating packages
echo "Updating system software"
sudo pacman -Syu

# Installing apps
echo "Installing software"
sudo pacman -S \
	nano \
	neovim \
	git \
	neofetch \
	gufw \
	flatpak \
	ffmpeg \
	base-devel \
	yay \
	just \
	curl \
	wget \
	brave-browser
