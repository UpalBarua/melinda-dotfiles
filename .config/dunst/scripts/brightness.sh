#!/bin/bash

if [[ "$1" = "screen" ]]; then
    device=intel_backlight
    declare -i id=5969
elif [[ "$1" = "kb" ]]; then
    device=apple::kbd_backlight
    declare -i id=6779
fi
echo "$device"

current=$(brightnessctl -d "$device" | grep "Current" | awk -F'[()]' '{print $2}' | sed 's/%//g')

if [[ "$1" = "screen" ]]; then
    message="Brightness ${current}%"
    if [[ "$current" -lt "50" ]]; then
        icon="/usr/share/icons/Papirus-Dark/symbolic/status/display-brightness-low-symbolic.svg"
    else
        icon="/usr/share/icons/Papirus-Dark/symbolic/status/display-brightness-high-symbolic.svg"
    fi
elif [[ "$1" = "kb" ]]; then
    message="Keyboard brightness ${current}%"
    if [[ "$current" -eq "0" ]]; then
        icon="cross"
    else
        icon="kb-brightness"
    fi
fi

dunstify -a "$1" -r "$id" -i "$icon" -h int:value:"$current" "$message"
