#!/bin/bash
. ./utils.sh

BASE_PACKAGES=$( cat "$BASE_PACKAGES" )
COMMON_PACKAGES=$( cat "$COMMON_PACKAGES" )
FLATPAK_PACKAGES=$( cat "$FLATPAK_PACKAGES" )

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

## Install apt programs ##
sudo pacman -S $BASE_PACKAGES 
sudo pacman -S $COMMON_PACKAGES 

bash ./github_instalations.sh
