#!/usr/bin/env bash

# Check if a process is running and kill it
kill_process() {
    if pgrep -x "$1" > /dev/null; then
        killall "$1"
    fi
}

# Kill existing processes if running
kill_process awww-daemon
kill_process waybar
kill_process mako
kill_process hypridle

# start services
awww-daemon &
waybar &
mako &
wl-paste --type text --watch cliphist store & 
wl-paste --type image --watch cliphist store &
hypridle &
