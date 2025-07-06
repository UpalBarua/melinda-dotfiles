#!/bin/sh

# Configuration
NOTIFICATION_ICON="media-tape"
VOLUME="60"  # Adjust via `pactl`/`amixer` (mpg123 has no built-in volume control)

# Radio stations - format: "Number. Name;URL"
RADIO_STATIONS=(
  "1. Lofi Girl ☕️🎶;https://play.streamafrica.net/lofiradio"
  "2. Chillhop ☕️🎶;http://stream.zeno.fm/fyn8eh3h5f8uv"
  "3. Box Lofi ☕️🎶;http://stream.zeno.fm/f3wvbbqmdg8uv"
  "4. The Bootleg Boy ☕️🎶;http://stream.zeno.fm/0r0xa792kwzuv"
  "5. Radio Spinner ☕️🎶;https://live.radiospinner.com/lofi-hip-hop-64"
  "6. SmoothChill ☕️🎶;https://media-ssl.musicradio.com/SmoothChill"
)

# Send notification with station name
show_notification() {
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "Playing now: $1" --icon="$NOTIFICATION_ICON"
  fi
}

# Generate menu for Rofi
show_menu() {
  for station in "${RADIO_STATIONS[@]}"; do
    echo "${station%;*}"  # Print station name (before ';')
  done
}

# Fetch URL for selected station
get_station_url() {
  local choice="$1"
  for station in "${RADIO_STATIONS[@]}"; do
    if [ "$choice" = "$(echo "$station" | cut -d. -f1)" ]; then
      echo "${station#*;}"  # Print URL (after ';')
      return 0
    fi
  done
  return 1  # Station not found
}

# Set system volume (if PulseAudio is used)
set_volume() {
  if command -v pactl >/dev/null 2>&1; then
    pactl set-sink-volume @DEFAULT_SINK@ "$VOLUME%"
  elif command -v amixer >/dev/null 2>&1; then
    amixer -D pulse sset Master "$VOLUME%"
  fi
}

main() {
  # Kill existing mpg123 instances to avoid duplicates
  pkill -f "mpg123" || true

  # Show menu and get user choice
  choice=$(show_menu | rofi -dmenu | cut -d. -f1 | tr -d '[:space:]')
  [ -z "$choice" ] && exit 0  # Exit if user canceled

  # Get URL and station name
  url=$(get_station_url "$choice")
  station_name=$(echo "${RADIO_STATIONS[$((choice-1))]}" | cut -d';' -f1 | cut -d' ' -f2-)

  if [ -z "$url" ]; then
    show_notification "Error: Invalid selection!"
    exit 1
  fi

  # Set volume and play
  set_volume
  show_notification "$station_name"

  if ! command -v mpg123 >/dev/null 2>&1; then
    show_notification "Error: mpg123 not installed!"
    exit 1
  fi

  # Start playback (quiet mode, no terminal output)
  mpg123 -q "$url" || show_notification "Error: Failed to play stream!"
}

main
