#!/bin/sh
# Robust X11 Session Manager with Confirmations
# Options: Shutdown, Restart, Logout, Suspend, Lock

set -e  # Exit on error

# Configuration
CONFIRM_DESTRUCTIVE=true  # Set to false to disable confirmations
LOCK_CMD="slock"

show_menu() {
    printf "%b" "Shutdown\nRestart\nLogout\nSuspend\nLock" | \
        rofi -dmenu -i -p "Session"
}

confirm_action() {
    local action="$1"
    if [ "$CONFIRM_DESTRUCTIVE" = true ]; then
        response=$(printf "%b" "Yes\nNo" | rofi -dmenu -i -p "Confirm $action?" $ROFI_THEME)
        [ "$response" = "Yes" ] || exit 0
    fi
}

case $(show_menu) in
    "Shutdown")
        confirm_action "shutdown"
        systemctl poweroff
        ;;
    "Restart")
        confirm_action "restart"
        systemctl reboot
        ;;
    "Logout")
        confirm_action "logout"
        # Graceful X11 session termination
        pkill -15 -u "$USER" Xorg || pkill -15 -u "$USER" xinit
        ;;
    "Suspend")
        systemctl suspend
        $LOCK_CMD  # Lock after suspend
        ;;
    "Lock")
        $LOCK_CMD
        ;;
    *)
        exit 0  # Clean exit on no selection
        ;;
esac
