#!/bin/sh
# Universal Session Manager (Niri/dwm) with Nerd Font Icons

# --- Configuration ---
# Detection for Locker
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    LOCK_CMD="hyprlock"
else
    LOCK_CMD="slock"
fi

CONFIRM_DESTRUCTIVE=true

# --- Nerd Font Icons ---
# Icons used:  (Lock),  (Suspend), 󰗼 (Logout),  (Restart),  (Shutdown)
I_LOCK="  Lock"
I_SUSP="  Suspend"
I_EXIT="󰗼  Logout"
I_REBT="  Restart"
I_OFF="  Shutdown"

# --- Actions List ---
ACTIONS="$I_LOCK\n$I_SUSP\n$I_EXIT\n$I_REBT\n$I_OFF"

show_menu() {
    printf "%b" "$ACTIONS" | rofi -dmenu -i -p "Session"
}

confirm_action() {
    [ "$CONFIRM_DESTRUCTIVE" = false ] && return 0
    # Returns 0 (true) if Yes is picked
    res=$(printf "No\nYes" | rofi -dmenu -i -p "Confirm $1?")
    [ "$res" = "Yes" ]
}

# --- Main Logic ---
SELECTION=$(show_menu)

case "$SELECTION" in
    *"Lock")
        $LOCK_CMD
        ;;
    *"Suspend")
        # Lock first for security, then suspend
        $LOCK_CMD & sleep 1 && systemctl suspend
        ;;
    *"Logout")
        confirm_action "Logout" && loginctl terminate-user "$USER"
        ;;
    *"Restart")
        confirm_action "Restart" && systemctl reboot
        ;;
    *"Shutdown")
        confirm_action "Shutdown" && systemctl poweroff
        ;;
    *)
        exit 0
        ;;
esac
