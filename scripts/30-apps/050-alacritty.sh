#!/usr/bin/env bash

# Alacritty cannot be installed with home-manager 
# since it doesn't install well gui apps
 
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
