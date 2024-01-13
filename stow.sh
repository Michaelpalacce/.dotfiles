#!/usr/bin/env bash
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

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

if ! command_exists stow; then
    print_color "$GREEN" "stow not found, installing"
    sudo apt install stow -y
else
    print_color "$YELLOW" "stow exists, skipping"
fi

FOLDERS=("nvim" "editorconfig" "sh" "tmux" "bin" "gitignore")

for dir in ${FOLDERS[@]} ; do
    echo "stow $dir"
    stow $dir
done
