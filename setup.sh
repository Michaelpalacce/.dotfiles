#!/usr/bin/env bash

# Function to check if a command is available
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

if ! command_exists apt-get; then
    print_color "$RED" "Error: apt-get not found, for now that's all that's supported"
    exit 1
else
    print_color "$GREEN" "Setting up"
fi

# Install nvim
if ! command_exists nvim; then
    print_color "$GREEN" "nvim not found, installing"
    # Install dependencies
    sudo apt-get install -y git software-properties-common ripgrep fd-find python3-dev python3-pip
    sudo ln -s $(which fdfind) ~/.local/bin/fd

    sudo add-apt-repository ppa:neovim-ppa/unstable -y

    sudo apt-get update
    sudo apt-get install -y neovim
else
    print_color "$YELLOW" "nvim exists, skipping"
fi

# Clone repo
DOTFILES_DIR="$HOME/.dotfiles"

# Checkout .dotfiles if it does not exist
if [ -d $DOTFILES_DIR ]; then
    print_color "$YELLOW" "$DOTFILES_DIR exists, skipping"
else 
    print_color "$GREEN" "$DOTFILES_DIR does not exist, checking the repository out"
    git clone https://github.com/Michaelpalacce/.dotfiles.git $DOTFILES_DIR
fi

pushd $DOTFILES_DIR
    . ./stow.sh
popd

if ! command_exists zsh; then
    print_color "$GREEN" "zsh not found, installing"
    sudo apt install zsh -y
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    print_color "$YELLOW" "zsh exists, skipping"
fi

if ! command_exists tmux; then
    print_color "$GREEN" "tmux not found, installing"
    sudo apt install tmux -y
else
    print_color "$YELLOW" "tmux exists, skipping"
fi

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d $TPM_DIR ]; then 
    print_color "$YELLOW" "$TPM_DIR exists, skipping"
else
    print_color "$GREEN" "$TPM_DIR does not exist, installing TPM"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
