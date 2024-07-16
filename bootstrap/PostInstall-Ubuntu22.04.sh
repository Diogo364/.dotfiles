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

# ----------------------------- Restore Custom Keybindings ----------------------------- #
cat ./keybindings/ubuntu-gnome/media-keybindings | dconf load /org/gnome/settings-daemon/plugins/media-keys/
cat ./keybindings/ubuntu-gnome/desktop-keybindings | dconf load /org/gnome/desktop/wm/keybindings/
cat ./keybindings/ubuntu-gnome/shell-keybindings | dconf load /org/gnome/shell/keybindings/
cat ./keybindings/ubuntu-gnome/mutter-keybindings | dconf load /org/gnome/mutter/keybindings/
cat ./keybindings/ubuntu-gnome/wayland-keybindings | dconf load /org/gnome/mutter/wayland/keybindings/

# ---------------------------------------------------------------------- #

bash ./github_instalations.sh
