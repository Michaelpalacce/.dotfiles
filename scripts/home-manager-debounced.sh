#!/usr/bin/env bash

# Responsible for calling `home-manager switch` after a debounce period of 1 day


# Path to the timestamp file
TIMESTAMP_FILE="$HOME/.last_home_manager_switch"

# Function to get the current time in seconds
current_time() {
    date +%s
}

# Function to get the last switch time in seconds
last_switch_time() {
    if [[ -f "$TIMESTAMP_FILE" ]]; then
        cat "$TIMESTAMP_FILE"
    else
        echo 0
    fi
}

# Run home-manager switch if more than 24 hours (86400 seconds) have passed
if (( $(current_time) - $(last_switch_time) >= 86400 )); then
    echo "Running home-manager switch..."
    home-manager switch

    # Update the timestamp file with the current time
    current_time > "$TIMESTAMP_FILE"
else
    echo "Less than a day since last switch. Skipping home-manager switch."
fi
