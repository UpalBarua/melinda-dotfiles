#!/bin/sh

wallpaper=$(cat $HOME/.fehbg | awk -F"'" '{print $2}' | tr -d '[:space:]')

if [ -e "$wallpaper" ]; then
    rm -f "$wallpaper"
    notify-send "Previous wallpaper was deleted"
else
    notify-send "No previous wallpaper found"
fi

random-bg.sh
