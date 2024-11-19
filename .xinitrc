#!/usr/bin/env bash

xrdb -load ~/.Xresources &
exec dwm
