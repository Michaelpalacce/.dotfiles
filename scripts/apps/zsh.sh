#!/usr/bin/env bash

# Zsh installed outside of `home-manager` so the setup is in one place

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

# Check if zsh is installed
if ! command_exists zsh; then
    installOsSpecific zsh
    # Clean up zshrc, since I have my own
    rm -rf $HOME/.zshrc
else
    print_color "$YELLOW" "zsh exists, skipping"
fi

ZSH_DIR="$HOME/.oh-my-zsh"

if [ -d $ZSH_DIR ]; then 
    print_color "$YELLOW" "$ZSH_DIR exists, skipping"
else
    print_color "$GREEN" "$ZSH_DIR does not exist, running installer"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

# Install zsh plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

ZSH_AUTOSUGGESTIONS_DIR="${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
if [ -d $ZSH_AUTOSUGGESTIONS_DIR ]; then 
    print_color "$YELLOW" "zsh-autosuggestions exists, skipping"
else
    print_color "$GREEN" "zsh-autosuggestions does not exist, checking the repository out"
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIR
fi
