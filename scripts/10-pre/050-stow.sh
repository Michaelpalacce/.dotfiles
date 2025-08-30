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
    "gitconfig"
    "aerospace"
    "hyprland"
    "rofi"
    "hyprpanel"
    "waypaper"
    "ticker"
    "waycorner"
    "xsettingsd"
)

for dir in ${FOLDERS[@]} ; do
    echo "Stowing $dir"
    stow --restow $dir || (echo "Error: Could not stow $dir" && exit 1)
done

if [ ! -L "/etc/pacman.conf" ]; then
    sudo rm -rf /etc/pacman.conf
fi   

# Stow pacman.conf
sudo stow --target=/etc pacman

sudo stow --target=/usr/share/sddm/themes sddm-themes
sudo stow --target=/etc sddm
