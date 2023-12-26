#!/usr/bin/env bash

# kill existing process
killall -9 sxhkd picom dunst greenclip xidlehook

# Start programs
sxhkd &
nitrogen --restore &
picom -b &
dunst &
greenclip daemon &
thunar --daemon & 
# xsetroot -cursor_name left_ptr &
$HOME/.config/polybar/scripts/bspwm-launch.sh &
$HOME/.local/bin/power-manager &
$HOME/.local/bin/low-battery-notifier &
