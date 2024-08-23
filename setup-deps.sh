#!/usr/bin/env bash

# This file contains dependencies that are needed for the setup.sh file to be ran.
# You can satisfy these yourself however needed if you don't want to run this script:
# - nix
# - home-manager
# - git
# - curl
# - stow
#

# ANSI color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No color

# Function to print colored text
print_color() {
    local color="$1"
    local message="$2"
    echo -e "${color}${message}${NC}"
}

# Function to check if a command is available
# https://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

installOsSpecific() {
    if command_exists apt-get; then
        print_color "$GREEN" "Setting up"
        sudo apt-get install -y "$1"
    elif command_exists brew; then 
        brew install "$1"
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
}

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

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
