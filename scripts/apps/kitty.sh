#!/usr/bin/env bash

# Kitty cannot be installed with home-manager 
# since it doesn't install well gui apps

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

installKitty() {
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
}

if ! command_exists kitten; then
    print_color "$GREEN" "kitten not found, installing (this may be a false positive as `kitten` only works in kitty terminal)"
else
    print_color "$YELLOW" "kitten exists, skipping"
fi
