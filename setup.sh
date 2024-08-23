#!/usr/bin/env bash

# Dependencies
# - git
# - curl
# - stow
# - nix
# - home-manager

# ------------------------ Variables -------------------------------
DOTFILES_DIR="$HOME/.dotfiles"

# ------------------------ Helper Functions -------------------------------

pushd $DOTFILES_DIR
    for helper in ./scripts/00-helpers/*; do
        . $helper
    done
popd

# ------------------------ Setup -------------------------------

if command_exists apt-get; then
    print_color "$GREEN" "Setting up for Debian based systems"
elif command_exists brew; then 
    print_color "$GREEN" "Setting up for MacOS"
else
    print_color "$RED" "Error: No package manager found"
    exit 1
fi

print_color "$YELLOW" "Notice: This script has dependencies that need to be installed. If you have not done so already, run 'setup-deps.sh'"

# Clone repo

# Checkout .dotfiles if it does not exist
if [ -d $DOTFILES_DIR ]; then
    print_color "$YELLOW" "$DOTFILES_DIR exists, skipping"
else 
    print_color "$GREEN" "$DOTFILES_DIR does not exist, checking the repository out"
    git clone https://github.com/Michaelpalacce/.dotfiles.git $DOTFILES_DIR
fi

pushd $DOTFILES_DIR
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
