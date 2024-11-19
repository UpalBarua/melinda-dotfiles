#!/usr/bin/env bash

# Check if a process is running and kill it
kill_process() {
    if pgrep -x "$1" > /dev/null; then
        killall "$1"
    fi
}

# Kill existing processes if running
kill_process sxhkd
kill_process picom
kill_process dunst
kill_process greenclip
kill_process xidlehook

# Start programs
sxhkd &
picom -b &
dunst &
greenclip daemon &
xsetroot -cursor_name left_ptr &
$HOME/.fehbg &
$HOME/.config/polybar/scripts/bspwm-launch.sh &
$HOME/.local/bin/power-manager &

