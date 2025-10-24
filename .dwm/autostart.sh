#!/usr/bin/env bash

# Check if a process is running and kill it
kill_process() {
    if pgrep -x "$1" > /dev/null; then
        killall "$1"
    fi
}

# Kill existing processes if running
kill_process picom
kill_process dunst
kill_process greenclip
kill_process xidlehook
kill_process dwmblocks 

# monitor configuration
~/.local/bin/monitors-setup.sh 

# start services
~/.fehbg &
dwmblocks &
picom -b &
dunst &
greenclip daemon &
xsetroot -cursor_name left_ptr &
~/.local/bin/power-manager &
