#!/usr/bin/env bash

# Dependencies
# - git
# - curl
# - stow
# - nix
# - home-manager

# ------------------------ Variables -------------------------------

DOTFILES_DIR="$HOME/.dotfiles"

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

if command_exists apt-get; then
    print_color "$GREEN" "Setting up for Debian based systems"
elif command_exists brew; then 
    print_color "$GREEN" "Setting up for MacOS"
else
    print_color "$RED" "Error: No package manager found"
    exit 1
fi

# ------------------------ Clone repo -------------------------------

# Checkout .dotfiles if it does not exist
if [ -d $DOTFILES_DIR ]; then
    print_color "$YELLOW" "$DOTFILES_DIR exists, skipping"
else 
    print_color "$GREEN" "$DOTFILES_DIR does not exist, checking the repository out"
    git clone https://github.com/Michaelpalacce/.dotfiles.git $DOTFILES_DIR
fi

# ------------------------ Helper Functions -------------------------------

pushd $DOTFILES_DIR
    for helper in ./scripts/00-helpers/*; do
        . $helper
    done
popd

# ------------------------ Setup -------------------------------

DEPS=("git" "curl")

for dep in ${DEPS[@]}; do
    if ! command_exists $dep; then
        print_color "$RED" "Error: $dep not found"
        exit 1
    fi
done

pushd $DOTFILES_DIR
    # Run dependency scripts
    for deps_script in ./scripts/05-deps/*; do
        . $deps_script
    done

    # Run pre scripts
    for pre_script in ./scripts/10-pre/*; do
        . $pre_script
    done

    # Run install scripts
    for install_script in ./scripts/20-install/*; do
        . $install_script
    done

    # Run app scripts
    for apps_file in ./scripts/30-apps/*; do
        . $apps_file
    done

    # Run post scripts
    for post_script in ./scripts/40-post/*; do
        . $post_script
    done
popd
