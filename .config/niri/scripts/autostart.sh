#!/usr/bin/env bash

# Check if a process is running and kill it
kill_process() {
    if pgrep -x "$1" > /dev/null; then
        killall "$1"
    fi
}

# Kill existing processes if running
kill_process awww-daemon
kill_process dunst
kill_process waybar
kill_process swayidle

# start services
dunst &
waybar &
awww-daemon &
wl-paste --type text --watch cliphist store & 
wl-paste --type image --watch cliphist store &
swayidle -w timeout 601 'niri msg action power-off-monitors' timeout 600 'swaylock -f' before-sleep 'swaylock -f'
