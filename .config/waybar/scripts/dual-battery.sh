#!/bin/sh

# Get AC status
ac=$(cat /sys/class/power_supply/AC*/online 2>/dev/null | head -n 1)
[ -z "$ac" ] && ac=0

total_now=0
total_full=0

for bat in /sys/class/power_supply/BAT*; do
    if [ -d "$bat" ]; then
        now=$(cat "$bat/energy_now" 2>/dev/null || cat "$bat/charge_now" 2>/dev/null || echo 0)
        full=$(cat "$bat/energy_full" 2>/dev/null || cat "$bat/charge_full" 2>/dev/null || echo 0)
        total_now=$((total_now + now))
        total_full=$((total_full + full))
    fi
done

if [ "$total_full" -gt 0 ]; then
    perc=$((total_now * 100 / total_full))
    [ "$perc" -gt 100 ] && perc=100
else
    perc=0
fi

# Determine the "class" for CSS and the "alt" for format-icons
if [ "$ac" -eq 1 ]; then
    status="charging"
else
    status="discharging"
fi

# Output JSON for Waybar
# text: what is displayed
# percentage: the raw number
# class: used for CSS styling
# alt: used to pick the icon from format-icons
printf '{"text": "%d%%", "percentage": %d, "class": "%s", "alt": "%s"}\n' "$perc" "$perc" "$status" "$status"
