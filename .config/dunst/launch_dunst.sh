#!/bin/bash

# source wal colors.
source ~/.cache/wal/colors.sh

pkill --exact dunst
dunst \
    -config=~/.config/dunst/dunstrc \
    -frame_width 1 \
    -lb $color0 \
    -lf $color7 \
    -lfr $color3 \
    -cb $color0 \
    -cf $color7 \
    -cfr $color3 \
    -nb $color0 \
    -nf $color7 \
    -nfr $color3 &
