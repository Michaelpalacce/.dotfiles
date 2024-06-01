#!/usr/bin/env bash

# This file contains dependencies that are needed for the setup.sh file to be ran.
# You can satisfy these yourself however needed if you don't want to run this script:
# - nix
# - home-manager

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
    if ! command_exists nix-shell; then
        echo "Nix not found, installing it now."
        sh <(curl -L https://nixos.org/nix/install) --daemon --yes
    fi
fi

# Mac specifics
if [[ "$machine" = "Mac" ]]; then
    if ! command_exists nix-shell; then
        echo "Nix not found, installing it now."
        sh <(curl -L https://nixos.org/nix/install) --yes
    fi
fi

# This is done in the post since we want the configuration
if command_exists home-manager; then
    echo "Home Manager already installed"
else
    echo "Installing Home Manager"
    source /etc/profile && nix-env --install --attr nixpkgs.lua
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
    rm -rf $HOME/.config/home-manager
fi
