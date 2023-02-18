#!/usr/bin/env bash

Xcursor.size: 32
xrdb -load ~/.Xresources &
# xgamma -gamma .855

exec bspwm
