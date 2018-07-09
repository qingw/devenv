#!/usr/bin/env bash


#CONKY
pkill conky
while pgrep -x conky >/dev/null; do sleep 1; done

conky -c ~/.config/conky/shortcuts &
conky -c ~/.config/conky/conky &
