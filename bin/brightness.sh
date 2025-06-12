#!/bin/bash

STEP="5%"
MIN_BRIGHTNESS=43

case "$1" in
  -i|--increase)
    brightnessctl set +$STEP
    ;;
  -d|--decrease)
    current=$(brightnessctl g)
    if [ "$current" -gt "$MIN_BRIGHTNESS" ]; then
      brightnessctl set $STEP-
    fi
    ;;
  *)
    echo "Usage: $0 -i|--increase | -d|--decrease"
    exit 1
    ;;
esac

BRI=$(brightnessctl | awk -F'[()]' '/Current/ {print $2}' | tr -d '%')
dunstify -r 6789 -t 2000 "󰃠  Display Brightness: ${BRI}%"
pkill -RTMIN+11 dwmblocks

