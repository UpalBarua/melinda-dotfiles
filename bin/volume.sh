#!/usr/bin/env bash

SINK="@DEFAULT_AUDIO_SINK@"
STEP=5

# 1. Get current volume status
RAW_INFO=$(wpctl get-volume "$SINK")
CUR_VOL=$(echo "$RAW_INFO" | awk '{print int($2 * 100)}')

# 2. Handle Actions
case "$1" in
    -i|--increase)
        NEW_VOL=$(( ((CUR_VOL / STEP) + 1) * STEP ))
        [[ $NEW_VOL -gt 100 ]] && NEW_VOL=100
        wpctl set-volume "$SINK" "${NEW_VOL}%"
        ;;
    -d|--decrease)
        [[ $CUR_VOL -le 0 ]] && NEW_VOL=0 || NEW_VOL=$(( ((CUR_VOL - 1) / STEP) * STEP ))
        wpctl set-volume "$SINK" "${NEW_VOL}%"
        ;;
    -m|--mute)
        wpctl set-mute "$SINK" toggle
        if wpctl get-volume "$SINK" | grep -q "MUTED"; then
            notify-send -a "System" -h string:x-canonical-private-synchronous:volume -u low "󰝟 Muted"
        else
            notify-send -a "System" -h string:x-canonical-private-synchronous:volume -h int:value:"$CUR_VOL" -u low "󰕾 Unmuted: ${CUR_VOL}%"
        fi
        exit 0
        ;;
    *) exit 1 ;;
esac

# 3. Choose Icon based on level
if [ "$NEW_VOL" -le 0 ]; then ICON="󰝟";
elif [ "$NEW_VOL" -le 30 ]; then ICON="󰕿";
elif [ "$NEW_VOL" -le 70 ]; then ICON="󰖀";
else ICON="󰕾"; fi

# 4. Notify
notify-send -a "System" \
    -h string:x-canonical-private-synchronous:volume \
    -h int:value:"$NEW_VOL" \
    -u low -t 1500 \
    "$ICON Volume: ${NEW_VOL}%"
