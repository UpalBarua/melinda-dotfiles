#!/usr/bin/env bash

bspc subscribe node_add node_remove | while read -r _; do
    # Get the focused desktop and the list of visible windows
    current_desktop=$(bspc query -D -d focused)
    visible_windows=$(bspc query -N -d "$current_desktop" -n .window.\!hidden)

    # Count the number of visible windows
    window_count=$(echo "$visible_windows" | wc -l)

    if [ "$window_count" -eq 1 ]; then
        # Check if the single window is floating or pseudo-tiled
        if echo "$visible_windows" | bspc query -N -n .window.floating.\!hidden > /dev/null || \
           echo "$visible_windows" | bspc query -N -n .window.pseudo_tiled.\!hidden > /dev/null; then
            bspc config border_width 2
            bspc config window_gap 5
        else
            bspc config border_width 0
            bspc config window_gap 0
        fi
    else
        bspc config border_width 2
        bspc config window_gap 5
    fi
done
