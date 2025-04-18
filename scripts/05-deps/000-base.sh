#!/usr/bin/env bash
#
# ----------------------------------------------------------------------------
# This script handles dependencies
#
# ----------------------------------------------------------------------------

installOsSpecific() {
    if command_exists apt-get; then
        print_color "$GREEN" "Setting up"
        sudo apt-get install -y "$1"
    elif command_exists brew; then 
        brew install "$1"
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
}

APPS=(
    "git"
    "curl"
    "stow"
)

for app in "${APPS[@]}"; do
    if ! command_exists $app; then
        installOsSpecific $app
    else
        print_color "$YELLOW" "$app exists, skipping"
    fi
done
