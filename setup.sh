#!/usr/bin/env bash

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

installNeovim() {
    if command_exists brew; then
        brew install neovim ripgrep fd
    elif command_exists apt-get; then
        print_color "$GREEN" "nvim not found, installing"
        # Install dependencies
        sudo apt-get install -y git software-properties-common ripgrep fd-find python3-dev python3-pip
        sudo ln -s $(which fdfind) ~/.local/bin/fd

        sudo add-apt-repository ppa:neovim-ppa/unstable -y

        sudo apt-get update
        sudo apt-get install -y neovim
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
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

if command_exists apt-get; then
    print_color "$GREEN" "Setting up"
elif command_exists brew; then 
    print_color "$GREEN" "Setting up"
else
    print_color "$RED" "Error: No package manager found"
    exit 1
fi

APTS=("fzf" "tmux" "git" "zsh" "ripgrep" "gh")

# Basic packages
for package in ${APTS[@]} ; do
    if ! command_exists $package; then
        print_color "$GREEN" "$package not found, installing"
        installOsSpecific $package
    else
        print_color "$YELLOW" "$package exists, skipping"
    fi
done

# Install nvim
if ! command_exists nvim; then
    installNeovim
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

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d $TPM_DIR ]; then 
    print_color "$YELLOW" "$TPM_DIR exists, skipping"
else
    print_color "$GREEN" "$TPM_DIR does not exist, checking the repository out"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

ZSH_DIR="$HOME/.oh-my-zsh"

if [ -d $ZSH_DIR ]; then 
    print_color "$YELLOW" "$ZSH_DIR exists, skipping"
else
    print_color "$GREEN" "$ZSH_DIR does not exist, running installer"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install zsh plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

ZSH_AUTOSUGGESTIONS_DIR="${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
if [ -d $ZSH_AUTOSUGGESTIONS_DIR ]; then 
    print_color "$YELLOW" "zsh-autosuggestions exists, skipping"
else
    print_color "$GREEN" "zsh-autosuggestions does not exist, checking the repository out"
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIR
fi

# Extra configuration
. ./scripts/extra.sh
