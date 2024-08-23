#!/usr/bin/env bash

# Dependencies
# - git
# - curl
# - nix
# - home-manager

# ------------------------ Helper Functions -------------------------------

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
DOTFILES_DIR="$HOME/.dotfiles"

# Checkout .dotfiles if it does not exist
if [ -d $DOTFILES_DIR ]; then
    print_color "$YELLOW" "$DOTFILES_DIR exists, skipping"
else 
    print_color "$GREEN" "$DOTFILES_DIR does not exist, checking the repository out"
    git clone https://github.com/Michaelpalacce/.dotfiles.git $DOTFILES_DIR
fi

TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ -d $TPM_DIR ]; then 
    print_color "$YELLOW" "$TPM_DIR exists, skipping"
else
    print_color "$GREEN" "$TPM_DIR does not exist, checking the repository out"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

home-manager switch

# Stow everything
pushd $DOTFILES_DIR
    . ./scripts/stow.sh

# Extra apps
pushd $DOTFILES_DIR
    . ./scripts/apps/zsh.sh
    . ./scripts/apps/alacritty.sh
popd

# Extra configuration
pushd $DOTFILES_DIR
    . ./scripts/post.sh
popd
