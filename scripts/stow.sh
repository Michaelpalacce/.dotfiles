#!/usr/bin/env bash
#
# ----------------------------------------------------------------------------
# This script sets up symbolic links for my dotfiles using GNU Stow.
#
# Dependencies:
#  - stow
#
# ----------------------------------------------------------------------------

FOLDERS=(
    "nvim"
    "editorconfig" 
    "sh" 
    "tmux"
    "bin"
    "gitignore"
    "cheatsheets"
    "alacritty"
    "home-manager"
    "nix"
)

for dir in ${FOLDERS[@]} ; do
    echo "Stowing $dir"
    stow $dir
done
