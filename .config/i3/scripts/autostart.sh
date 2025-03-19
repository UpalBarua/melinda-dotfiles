#!/usr/bin/env bash

# kill existing process
killall -9 picom dunst clipmenud xidlehook
xsetroot -cursor_name left_ptr &

# Start programs
~/.fehbg &
picom -b &
dunst &
clipmenud &
dwmblocks &
~/.local/bin/power-manager &
