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
	gnome-software-packagekit-plugin \
	ffmpeg \
	base-devel \
	yay \
	just \
	curl \
	wget \
	brave-browser

# Rust
echo "Installing Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#Pop OS Tiling tool
echo "Installing Pop OS Tiling Tool"
yay -S gnome-shell-extension-pop-shell

# Pop OS Launcher
echo "Installing Pop OS Launcher"
git clone https://github.com/pop-os/launcher.git
cd launcher
just build-release # Build
just install # Install locally
cd ~
rm -rf launcher

# Neovim Configurations
echo "Getting neovim configuration"
git clone https://github.com/Diogo364/my-nvim.git 
mv my-nvim /home/diogotn/.config/nvim
