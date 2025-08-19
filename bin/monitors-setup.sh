#!/bin/bash

# Check if HDMI-2 is connected
if xrandr | grep "HDMI-2 connected"; then
  xrandr --output eDP-1 --primary --mode 1920x1080 --output HDMI-2 --mode 1920x1080 --right-of eDP-1
fi
