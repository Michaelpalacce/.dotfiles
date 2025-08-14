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
    "zsh"
    "tmux"
    "bin"
    "cheatsheets"
    "alacritty"
    "gitignore"
    "aerospace"
    "hyprland"
    "waybar"
    "sherlock"
    "waypaper"
    "sway"
    "waycorner"
    "xsettingsd"
)

for dir in ${FOLDERS[@]} ; do
    echo "Stowing $dir"
    stow --restow $dir || (echo "Error: Could not stow $dir" && exit 1)
done
