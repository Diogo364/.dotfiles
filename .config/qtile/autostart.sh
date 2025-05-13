#!/bin/bash

# Applets
blueman-applet &
nm-applet &
kdeconnect-indicator &

picom &
~/.config/dunst/launch_dunst.sh &
