#!/usr/bin/env bash

# Installs neovim

installNeovim() {
    if command_exists brew; then
        brew install neovim
    elif command_exists apt-get; then
        # Install dependencies
        sudo add-apt-repository ppa:neovim-ppa/unstable -y

        sudo apt-get update
        sudo apt-get install -y neovim
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
}

if ! command_exists nvim; then
    print_color "$GREEN" "nvim not found, installing"
    installNeovim
else
    print_color "$YELLOW" "nvim exists, skipping"
fi
