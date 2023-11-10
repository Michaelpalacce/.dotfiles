#!/usr/bin/env bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No color

# Function to print colored text
print_color() {
    local color="$1"
    local message="$2"
    echo -e "${color}${message}${NC}"
}

if ! command_exists apt-get; then
    print_color "$RED" "Error: apt-get not found, for now that's all that's supported"
    exit 1
else
    print_color "$GREEN" "Setting up"
fi

# Install nvim
if ! command_exists nvim; then
    print_color "$GREEN" "nvim not found, installing all dependencies"
    # Install dependencies
    apt-get install -y git software-properties-common ripgrep fd-find python3-dev python3-pip
    ln -s $(which fdfind) ~/.local/bin/fd

    add-apt-repository ppa:neovim-ppa/unstable -y

    apt-get update
    apt-get install -y neovim
else
    print_color "$YELLOW" "nvim already installed, skipping"
fi

# Clone repo
DOTFILES_DIR="$HOME/.dotfiles-test"

# Checkout .dotfiles if it does not exist
if [ -d $DOTFILES_DIR ]; then
    print_color "$YELLOW" "$DOTFILES_DIR exists, skipping"
else 
    print_color "$GREEN" "$DOTFILES_DIR does not exist, checking the repository out"
    git clone https://github.com/Michaelpalacce/.dotfiles.git $DOTFILES_DIR
fi

pushd $DOTFILES_DIR
    FOLDERS=("nvim" "editorconfig" "bashrc")

    for dir in ${FOLDERS[@]} ; do
        echo "stow $dir"
        # stow $dir
    done
popd
