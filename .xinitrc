#!/usr/bin/env bash

xrandr --output HDMI-2 --mode 1920x1080
xrdb -load ~/.Xresources &
exec dwm
