#!/usr/bin/env bash

# ------------------------ Post Setup -------------------------------
# This script is run after the main setup script. 
# It contains OS specific setup and other things that should be run after the main setup script.

# Helper functions
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# ------------------------ OS Specific --------------------------------

# Linux specifics
if [[ "$machine" = "Linux" ]]; then
    if ! command_exists nix; then
        sh <(curl -L https://nixos.org/nix/install) --daemon --yes
    fi

    # Set alacritty as default terminal
    sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty
fi

# Mac specifics
if [[ "$machine" = "Mac" ]]; then
    if ! command_exists nix; then
        sh <(curl -L https://nixos.org/nix/install) --yes
    fi

    brew install gsed

    # Run macos.sh for some nice defaults
    . $HOME/.dotfiles/scripts/os/mac.sh
fi

# Install node if not

if ! command_exists node; then
    fnm install 18
fi
