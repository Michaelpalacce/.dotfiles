#!/usr/bin/env bash

# This file contains dependencies that are needed for the setup.sh file to be ran.
# You can satisfy these yourself however needed if you don't want to run this script:
# - nix
# - home-manager
#
# ------------------------ Helper Functions -------------------------------

pushd $DOTFILES_DIR
    for helper in ./.scripts/helpers/*; do
        . $helper
    done
popd

APPS=(
    "git"
    "curl"
    "stow"
)

for app in "${APPS[@]}"; do
    if ! command_exists $app; then
        installOsSpecific $app
    else
        print_color "$YELLOW" "$app exists, skipping"
    fi
done

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

    print_color "$RED" "--------------------------------- IMPORTANT ---------------------------------"
    print_color "$RED" "YOU HAVE TO RESTART YOUR SHELL TO USE HOME MANAGER AND CONTINUE SETUP"
    print_color "$RED" "--------------------------------- IMPORTANT ---------------------------------"
fi
