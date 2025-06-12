#!/usr/bin/env bash

# kill existing process
# killall -9 picom dunst clipmenud xidlehook
# xsetroot -cursor_name left_ptr &

# Start programs
random-bg.sh
dunst &
waybar &
# picom -b &
# clipmenud &
# ~/.local/bin/power-manager &

