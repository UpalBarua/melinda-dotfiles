#!/usr/bin/env bash

Xcursor.size: 32
xrdb -load ~/.Xresources &

exec bspwm
