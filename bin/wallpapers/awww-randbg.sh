#!/bin/bash

# Random Wallpaper Script
# Selects and sets a random wallpaper using awww

wallpaper_dir="$HOME/pictures/wallpapers"

if ! command -v awww &>/dev/null; then
    echo "Error: awww is not installed. Please install it first."
    exit 1
fi

if ! command -v awww-daemon &>/dev/null; then
    echo "Error: awww-daemon is not installed. Please install it first."
    exit 1
fi

if [ ! -d "$wallpaper_dir" ]; then
    echo "Error: Wallpaper directory not found: $wallpaper_dir"
    exit 1
fi

if ! pgrep -x awww-daemon > /dev/null; then
    awww-daemon &
    sleep 1
fi

wallpaper=$(find "$wallpaper_dir" -type f \( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.webp' -o -name '*.gif' \) | shuf -n 1)

if [ -z "$wallpaper" ]; then
    echo "Error: No suitable wallpapers found in $wallpaper_dir"
    exit 1
fi

awww img --transition-step 30 --transition-fps 60 --transition-type center "$wallpaper"

echo "Wallpaper set to: $wallpaper"
