#!/bin/bash

# Fixed Random Wallpaper Script
# Safely selects and sets a random wallpaper using feh

# Configuration
wallpaper_dir="$HOME/pictures/wallpapers"

# Check if feh is installed
if ! command -v feh &>/dev/null; then
    echo "Error: feh is not installed. Please install it first."
    exit 1
fi

# Check if wallpaper directory exists
if [ ! -d "$wallpaper_dir" ]; then
    echo "Error: Wallpaper directory not found: $wallpaper_dir"
    exit 1
fi

# Find all image files and select one randomly
wallpaper=$(find "$wallpaper_dir" -type f \( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.webp' \) | shuf -n 1)

# Check if a wallpaper was found
if [ -z "$wallpaper" ]; then
    echo "Error: No suitable wallpapers found in $wallpaper_dir"
    exit 1
fi

# Set the wallpaper
feh --bg-fill "$wallpaper" "$wallpaper"

echo "Wallpaper set to: $wallpaper"
