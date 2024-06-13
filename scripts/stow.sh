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
    "cheatsheets"
    "alacritty"
    "home-manager"
    "gitignore"
)

for dir in ${FOLDERS[@]} ; do
    echo "Stowing $dir"
    stow --restow $dir
done
