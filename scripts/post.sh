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
    source /etc/profile && nix-env --install --attr nixpkgs.lua
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
fi

echo "Home Manager installed, switching to configuration (home-manager switch)"
home-manager switch
