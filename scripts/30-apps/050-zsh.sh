#!/usr/bin/env bash

# Zsh installed outside of `home-manager` so the setup is in one place

ZSH_DIR="$HOME/.oh-my-zsh"

if [ -d $ZSH_DIR ]; then 
    print_color "$YELLOW" "$ZSH_DIR exists, skipping"
else
    print_color "$GREEN" "$ZSH_DIR does not exist, running installer"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
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
