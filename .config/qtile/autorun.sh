#!/bin/bash

# IO Config
setxkbmap -layout us -variant intl -option ctrl:nocaps

i3enable-touchpad &

wal -R &
xrdb ~/.Xresources &
feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"

autorandr --change &
notify-send -u low  "Loaded Configuration Script"
