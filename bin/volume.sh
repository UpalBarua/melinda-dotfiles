#!/bin/bash

SINK="@DEFAULT_SINK@"
AUDIO_SINK="@DEFAULT_AUDIO_SINK@"
STEP="5%"

case "$1" in
  -i|--increase)
    wpctl set-volume "$SINK" "$STEP"+ -l 1
    ;;
  -d|--decrease)
    wpctl set-volume "$SINK" "$STEP"-
    ;;
  -m|--mute)
    wpctl set-mute "$SINK" toggle
    IS_MUTED=$(wpctl get-volume "$AUDIO_SINK" | grep -q MUTED && echo "󰖁  Muted" || echo "  Unmuted")
    dunstify -r 3456 -t 2000 "$IS_MUTED"
    pkill -RTMIN+10 dwmblocks
    exit 0
    ;;
  *)
    echo "Usage: $0 -i|--increase | -d|--decrease | -m|--mute"
    exit 1
    ;;
esac

# Show volume level if not muted
VOL=$(wpctl get-volume "$AUDIO_SINK" 2>/dev/null | awk '{print int($2 * 100)}')
dunstify -r 3456 -t 2000 "  Volume Level: ${VOL}%"
pkill -RTMIN+10 dwmblocks

