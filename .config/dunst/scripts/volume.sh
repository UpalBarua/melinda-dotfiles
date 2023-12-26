#!/bin/bash

volume=$(amixer -D pulse sget Master | tail -1 | awk -F'[][]' '{print $2}' | sed 's/%//g')

if [[ "$volume" -eq "0" ]]; then
    icon="/usr/share/icons/Papirus-Dark/symbolic/status/audio-volume-low-symbolic.svg"
elif [[ "$volume" -lt "100" ]]; then
    icon="/usr/share/icons/Papirus-Dark/symbolic/status/audio-volume-medium-symbolic.svg"
else
    icon="/usr/share/icons/Papirus-Dark/symbolic/status/audio-volume-high-symbolic.svg"
fi

dunstify -a "volume" -i "$icon" -r 3456 -h int:value:"$volume" "Volume ${volume}%"
