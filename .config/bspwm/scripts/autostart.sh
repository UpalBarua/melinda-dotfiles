#!/usr/bin/env bash

 # kill existing process
killall -9 sxhkd picom dunst greenclip xidlehook

# Start programs 
sxhkd &
nitrogen --restore &
picom -b &
dunst &
greenclip daemon &
xsetroot -cursor_name left_ptr &
$HOME/.config/polybar/scripts/bspwm-launch.sh &
$HOME/.local/bin/power-manager &
$HOME/.local/bin/battery0-notifier &
$HOME/.local/bin/battery1-notifier &

# $HOME/.local/bin/lockwall &
# picom -b --experimental-backends --animations --animation-window-mass 0.85 --animation-for-open-window zoom --animation-stiffness 350 & 
# killall -9 transmission-daemon; transmission-daemon &
# notify-send 'Inspiron' 'welcome back!'
# picom -b --experimental-backends &
# /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# $HOME/.local/bin/low-battery-notifier &
# feh --bg-fill --randomize --recursive --no-fehbg $HOME/Pictures/Wallpapers/ &
# $HOME/.fehbg &
# sleep 2 && if [[ ! $(pgrep -f brave) ]]; then brave; fi &
# nitrogen --set-zoom-fill --random --save $HOME/Pictures/Wallpapers/ &
