#!/usr/bin/env bash

 # kill existing process
killall -9 picom dunst greenclip xidlehook

# Start programs 
nitrogen --restore &
picom -b --experimental-backends &
dunst &
greenclip daemon &
$HOME/.config/polybar/scripts/i3-launch.sh &
$HOME/.local/bin/power-manager &
xsetroot -cursor_name left_ptr &

# $HOME/.local/bin/low-battery-notifier &
# /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# killall -9 transmission-daemon; transmission-daemon &
