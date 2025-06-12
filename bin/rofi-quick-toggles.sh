#!/bin/bash

# Define the list of options
options=(
  "Bangla keyboard:ibus-daemon:ibus-daemon -drxR"
  "Picom:picom:picom -b"
  "Polkit agent:polkit-mate-authentication-agent-1:/usr/lib/mate-polkit/polkit-mate-authentication-agent-1"
  "Transmission Daemon:transmission-daemon:transmission-daemon"
  "Flameshot:flameshot:flameshot"
)

# Generate Rofi menu items (just the names)
menu_items=$(printf "%s\n" "${options[@]}" | cut -d':' -f1)

# Use Rofi to select an option with case-insensitive matching
selection=$(echo "$menu_items" | rofi -dmenu -p "Toggle:" -matching fuzzy -i)

if [[ -z "$selection" ]]; then
  notify-send "No program selected. Exiting."
  exit 1
fi

# Find the selected option (case insensitive)
selected_option=""
for option in "${options[@]}"; do
  option_name=$(echo "$option" | cut -d':' -f1)
  if [[ "${option_name,,}" == "${selection,,}" ]]; then
    selected_option="$option"
    break
  fi
done

if [[ -z "$selected_option" ]]; then
  notify-send "Error: Selected option '$selection' not found in configuration."
  exit 1
fi

# Extract details from the selected option
IFS=':' read -r name process_name start_command <<< "$selected_option"

# Check if process is running (case insensitive) and toggle it
if pgrep -fi "$process_name" > /dev/null; then
  notify-send "$name stopped" "Daemon was killed"
  pkill -9 -fi "$process_name"
else
  notify-send "$name started" "Daemon was launched"
  eval "$start_command" &
fi
