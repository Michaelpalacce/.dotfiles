#!/usr/bin/env zsh

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

installOsSpecific() {
    if command_exists apt-get; then
        sudo apt-get install -y "$1"
    elif command_exists brew; then 
        brew install "$1"
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
}

if ! command_exists stow; then
    print_color "$GREEN" "stow not found, installing"
    installOsSpecific stow
else
    print_color "$YELLOW" "stow exists, skipping"
fi

FOLDERS=("nvim" "editorconfig" "sh" "tmux" "bin" "gitignore" "cheatsheets" "alacritty" "home-manager")

for dir in ${FOLDERS[@]} ; do
    echo "stow $dir"
    stow $dir
done

# Check if /etc/nixos exists first
if [[ -d "/etc/nixos" ]]; then
    sudo stow --target "/etc/nixos" nix
fi
