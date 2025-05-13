#!/bin/bash

# IO Config
setxkbmap -layout us -variant intl -option ctrl:nocaps

i3enable-touchpad &

autorandr --change &

wal -Rs &
xrdb ~/.Xresources &
feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"

notify-send -u low  "Loaded Configuration Script"
