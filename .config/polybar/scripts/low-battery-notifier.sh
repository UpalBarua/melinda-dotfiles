#!/bin/bash

### VARIABLES

LOW_BAT=20  # Battery percentage below which is considered low

# Battery paths (modify if necessary)
BAT0_PATH="/sys/class/power_supply/BAT0"
BAT1_PATH="/sys/class/power_supply/BAT1"

# Function to read battery values
read_battery() {
    local BAT_PATH=$1
    if [[ -f "$BAT_PATH/charge_full" ]]; then
        FULL="$BAT_PATH/charge_full"
        NOW="$BAT_PATH/charge_now"
    elif [[ -f "$BAT_PATH/energy_full" ]]; then
        FULL="$BAT_PATH/energy_full"
        NOW="$BAT_PATH/energy_now"
    else
        return 1
    fi

    if [[ -f "$BAT_PATH/status" ]]; then
        STAT="$BAT_PATH/status"
    else
        return 1
    fi

    local FULL_VAL=$(cat "$FULL")
    local NOW_VAL=$(cat "$NOW")
    local STAT_VAL=$(cat "$STAT")
    local PERCENT=$(( 100 * NOW_VAL / FULL_VAL ))

    echo "$PERCENT $STAT_VAL"
}

# Function to handle battery check
check_battery() {
    local BAT_PATH=$1
    local BAT_LABEL=$2

    if [[ -d "$BAT_PATH" ]]; then
        local result=$(read_battery "$BAT_PATH")
        local success=$?

        if [[ $success -eq 0 ]]; then
            local PERCENT=$(echo "$result" | awk '{print $1}')
            local STATUS=$(echo "$result" | awk '{print $2}')

            if [[ $PERCENT -lt $LOW_BAT && "$STATUS" = "Discharging" ]]; then
                echo "Battery $BAT_LABEL Low ($PERCENT%)"
            fi
        fi
    fi
}

### MAIN SCRIPT

# Run only if at least one battery is detected
if ls -1qA /sys/class/power_supply/ | grep -q BAT; then 
    check_battery "$BAT0_PATH" "0"

    if [[ -d "$BAT1_PATH" ]]; then
        check_battery "$BAT1_PATH" "1"
    fi
fi

