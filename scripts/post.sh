#!/usr/bin/env bash

# Executes post installation and stow tasks

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# ------------------------ Home Manager ------------------------
# This is done in the post since we want the configuration
if command_exists home-manager; then
    echo "Home Manager already installed"
else
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
    home-manager switch
fi
