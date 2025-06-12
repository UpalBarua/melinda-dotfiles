#!/usr/bin/env bash

# Check if a process is running and kill it
kill_process() {
    if pgrep -x "$1" > /dev/null; then
        killall "$1"
    fi
}

# Kill existing processes if running
kill_process dunst
kill_process greenclip
kill_process waybar

# Start programs
waybar &
dunst &
greenclip daemon &
~/.local/bin/random-swaybg.sh &
