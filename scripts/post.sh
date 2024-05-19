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

# ------------------------ Home Manager and Nix------------------------


# This is done in the post since we want the configuration
if command_exists home-manager; then
    echo "Home Manager already installed"
else
    source /etc/profile && nix-env --install --attr nixpkgs.lua
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
fi

echo "Home Manager installed, switching to configuration (home-manager switch). This is always triggered."
home-manager switch
