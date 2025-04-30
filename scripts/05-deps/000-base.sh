#!/usr/bin/env bash
#
# ----------------------------------------------------------------------------
# This script handles dependencies
# ----------------------------------------------------------------------------

APPS=(
    "git"
    "curl"
    "stow"
    "gcc"
    "make"
    "tmux"
)

for app in "${APPS[@]}"; do
    if ! command_exists $app; then
        print_color "$RED" "$app is a required dependency. Quitting installation."
        exit 1
    else
        print_color "$YELLOW" "$app exists, skipping"
    fi
done
