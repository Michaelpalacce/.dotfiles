#!/usr/bin/env bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

if ! command_exists apt-get; then
    echo "Error: apt-get not found, for now that's all that's supported"
    exit 1
fi

# Install nvim
if ! command_exists nvim; then
    echo "nvim not found, installing all dependencies"
    # Install dependencies
    apt-get install -y git software-properties-common ripgrep fd-find python3-dev python3-pip
    ln -s $(which fdfind) ~/.local/bin/fd

    add-apt-repository ppa:neovim-ppa/unstable -y

    apt-get update
    apt-get install -y neovim
fi

# Clone repo
DOTFILES_DIR="$HOME/.dotfiles"

# Checkout .dotfiles if it does not exist
if ! [ -d DOTFILES_DIR ]; then
    echo "$DOTFILES_DIR does not exist, creating it"
    mkdir $DOTFILES_DIR
    cd $HOME
    git clone https://github.com/Michaelpalacce/.dotfiles.git
fi

pushd $DOTFILES_DIR
    FOLDERS=("nvim" "editorconfig" "bashrc")

    for dir in ${FOLDERS[@]} ; do
        echo "stow $dir"
        stow $dir
    done
popd
