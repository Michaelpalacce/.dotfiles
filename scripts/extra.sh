#!/usr/bin/env bash
# Extra contains some extra tools to make everything work right, but these are not critical

# Function to check if a command is available
# https://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

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

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# If something is not in nix... (stow is, just leaving it here for reference)
APTS=("stow")

# Linux specifics
if [[ "$machine" = "Linux" ]]; then
    if ! command_exists nix; then
        sh <(curl -L https://nixos.org/nix/install) --daemon --yes
    fi

    # Basic packages
    for package in ${APTS[@]} ; do
        if ! command_exists $package; then
            print_color "$GREEN" "$package not found, installing"
            apt install -y $package
        else
            print_color "$YELLOW" "$package exists, skipping"
        fi
    done
fi

# Mac specifics
if [[ "$machine" = "Mac" ]]; then
    # @TODO: Manage this with nix
    if ! command_exists terminal-notifier; then
        brew install terminal-notifier 
    fi

    if ! command_exists nix; then
        sh <(curl -L https://nixos.org/nix/install) --yes
    fi

    # Run macos.sh for some nice defaults
    . $HOME/.dotfiles/scripts/macos.sh

    brew install gsed

    # Basic packages
    for package in ${APTS[@]} ; do
        if ! command_exists $package; then
            print_color "$GREEN" "$package not found, installing"
            brew install $package
        else
            print_color "$YELLOW" "$package exists, skipping"
        fi
    done
fi
