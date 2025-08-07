#!/usr/bin/env bash

# Exit on errors
set +o errexit

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

# ------------------------ Clone repo -------------------------------

# Checkout .dotfiles if it does not exist
if [ -d $DOTFILES_DIR ]; then
    print_color "$YELLOW" "$DOTFILES_DIR exists, skipping"
else 
    print_color "$GREEN" "$DOTFILES_DIR does not exist, checking the repository out"
    git clone https://github.com/Michaelpalacce/.dotfiles.git $DOTFILES_DIR
fi

# ------------------- Helper Functions -------------------------------

pushd $DOTFILES_DIR
    for helper in ./scripts/00-helpers/*; do
        . $helper
    done
popd

# ------------------------ Setup -------------------------------

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
