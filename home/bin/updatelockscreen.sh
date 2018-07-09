#!/usr/bin/env bash

SCREEN_R=$(xrandr | head -n 1 | cut -d' ' -f 8-10 | sed 's/ //g')

if [ -z "$@" ]; then
    betterlockscreen -u ~/Wallpapers -d 1
else
    betterlockscreen  $@
fi

