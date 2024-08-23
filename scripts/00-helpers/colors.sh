#!/usr/bin/env bash

# ------------------------------------------------
#
# Helper function to print colored text
#
# Arguments:
# $1: The color to use
# $2: The message to print
#
# Example: `print_color "$GREEN" "Hello, World!"`
#
# ------------------------------------------------

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

