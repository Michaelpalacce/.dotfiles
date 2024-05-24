#!/usr/bin/env bash
# This is used to install home-manager and setup all the programs I need

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
home-manager -f $HOME/.dotfiles/home-manager/.config/home-manager/home.nix switch
