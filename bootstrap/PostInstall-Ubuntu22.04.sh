# !/bin/bash
# Inspired by Diolinux's bootstrap script 
# https://github.com/Diolinux/Linux-Mint-19.x-PosInstall
. ./utils.sh

BASE_PACKAGES=$( get_formatted_packages "$BASE_PACKAGES" )
COMMON_PACKAGES=$( get_formatted_packages "$COMMON_PACKAGES" )
FLATPAK_PACKAGES=$( get_formatted_packages "$FLATPAK_PACKAGES" )

# ----------------------------- REQUISITOS ----------------------------- #
## Removing system locks ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Updating Repos ##
sudo apt update -y

## Install apt programs ##
apt install "$BASE_PACKAGES" -y
apt install "$COMMON_PACKAGES" -y


## Installing Flatpak packages ##
flatpak install "$FLATPAK_PACKAGES" -y

# Installing Brave Browser ##
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# ----------------------------- POST-INSTALLATION ----------------------------- #
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
bash ./github_instalations.sh
