#!/bin/bash

# IO Config
setxkbmap -layout us -variant intl &
i3enable-touchpad &

# Applets
blueman-applet &
nm-applet &

#--daemon --experimental-backends -CGb & Layout Config
xrdb ~/.Xresources &
feh --bg-scale $HOME/Pictures/wallpaper/current_wallpaper.jpg &
# picom --daemon --experimental-backends -CGb &
picom &
# autorandr --change &

