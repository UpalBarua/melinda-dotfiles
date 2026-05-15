#!/bin/bash

MUSIC_DIR="$HOME/music/Lofi"
NOTIFICATION_ICON="media-tape"

# Ensure we only look for MP3s since we are using mpg123
main() {
    pkill -f "mpg123" || true

    # Only find MP3 files
    files=$(find "$MUSIC_DIR" -maxdepth 1 -type f -name "*.mp3" -printf "%f\n" | sort)

    if [ -z "$files" ]; then
        notify-send "Error" "No MP3 files found in $MUSIC_DIR"
        exit 1
    fi

    selection=$(echo -e "--- Shuffle All ---\n$files" | rofi -dmenu -i -p "󰎆 mpg123")

    [ -z "$selection" ] && exit 0

    if [ "$selection" = "--- Shuffle All ---" ]; then
        notify-send "Playing" "Shuffling MP3 collection..."
        # -z: Shuffle, -Z: Random loop
        mpg123 -q -Z "$MUSIC_DIR"/*.mp3 &
    else
        notify-send "Now Playing" "$selection"
        mpg123 -q "$MUSIC_DIR/$selection" &
    fi
}

main
