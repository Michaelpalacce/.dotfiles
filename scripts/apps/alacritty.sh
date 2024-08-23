#!/usr/bin/env bash

# Alacritty cannot be installed with home-manager 
# since it doesn't install well gui apps
 
# Function to check if a command is available
# https://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# ANSI color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No color

# Function to print colored text
print_color() {
    local color="$1"
    local message="$2"
    echo -e "${color}${message}${NC}"
}

installAlacritty() {
    if command_exists brew; then
        brew install --cask alacritty
    elif command_exists apt-get; then
        sudo add-apt-repository ppa:aslatter/ppa -y
        sudo apt update
        sudo apt install -y alacritty
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
}


if ! command_exists alacritty; then
    print_color "$GREEN" "alacritty not found, installing"
    installAlacritty
else
    print_color "$YELLOW" "alacritty exists, skipping"
fi
