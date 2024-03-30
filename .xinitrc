#!/usr/bin/env bash

Xcursor.size: 32
xrdb -load ~/.Xresources &
xsetroot -cursor_name left_ptr &
# setxkbmap -option caps:swapescape
exec bspwm
