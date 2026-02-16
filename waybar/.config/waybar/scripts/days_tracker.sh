#!/bin/bash

STORAGE_FILE="$HOME/.config/waybar/scripts/.days_tracker_start_date"

# Function to get the current date in seconds since epoch
get_current_date() {
    date +%s
}

# Function to calculate days between two dates
get_days_diff() {
    local start_date=$1
    local end_date=$2
    echo $(( (end_date - start_date) / 86400 ))
}

# Reset the counter
if [ "$1" == "reset" ]; then
    echo "$(get_current_date)" > "$STORAGE_FILE"
    exit
fi

# Main logic
if [ ! -f "$STORAGE_FILE" ]; then
    # If the storage file doesn't exist, create it with the current date
    echo "$(get_current_date)" > "$STORAGE_FILE"
fi

start_date=$(cat "$STORAGE_FILE")
current_date=$(get_current_date)
days_clear=$(get_days_diff "$start_date" "$current_date")

# JSON output for Waybar
echo "{\"text\": \"$days_clear days\", \"tooltip\": \"Since:: $(date -d @$start_date)\"}"