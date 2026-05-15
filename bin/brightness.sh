#!/usr/bin/env bash

STEP=5
INFO=$(brightnessctl -m)
CUR_PERC=$(echo "$INFO" | cut -d',' -f4 | tr -d '%')

# 1. Calculate Snapped Value
if [[ "$1" == "-i" || "$1" == "--increase" ]]; then
    NEW_PERC=$(( ((CUR_PERC / STEP) + 1) * STEP ))
elif [[ "$1" == "-d" || "$1" == "--decrease" ]]; then
    [[ "$CUR_PERC" -le 0 ]] && NEW_PERC=0 || NEW_PERC=$(( ((CUR_PERC - 1) / STEP) * STEP ))
else
    exit 1
fi

# 2. Bounds check
(( NEW_PERC > 100 )) && NEW_PERC=100
(( NEW_PERC < 0 )) && NEW_PERC=0

# 3. Apply change
brightnessctl set "${NEW_PERC}%" > /dev/null

# 4. Choose Icon based on level
if [ "$NEW_PERC" -le 20 ]; then ICON="󰃞";
elif [ "$NEW_PERC" -le 40 ]; then ICON="󰃝";
elif [ "$NEW_PERC" -le 60 ]; then ICON="󰃟";
elif [ "$NEW_PERC" -le 80 ]; then ICON="󰃠";
else ICON="󰓅"; fi

# 5. Notify
notify-send -a "System" \
    -h string:x-canonical-private-synchronous:brightness \
    -h int:value:"$NEW_PERC" \
    -u low -t 1500 \
    "$ICON Brightness: ${NEW_PERC}%"
