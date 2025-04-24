#!/usr/bin/env bash

# ------------------------ Post Setup -------------------------------
# This script is run after the main setup script. 
# It contains OS specific setup and other things that should be run after the main setup script.

# Linux specifics
if [[ "$machine" = "Linux" ]]; then
    # Set alacritty as default terminal
    sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty
fi

# Mac specifics
if [[ "$machine" = "Mac" ]]; then
    # Run macos.sh for some nice defaults
    . $HOME/.dotfiles/scripts/os/Mac.sh
fi

# Install node if not
if ! command_exists node; then
    NODE_VER=22
    if command_exists fnm; then
        fnm install $NODE_VER
    fi

    if command_exists nvm; then
        nvm install $NODE_VER
    fi
fi
