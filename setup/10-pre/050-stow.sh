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
    "dunst"
    "cheatsheets"
    "alacritty"
    "gitignore"
    "gitconfig"
    "aerospace"
    "hyprland"
    "karabiner"
    "rofi"
    "waypaper"
    "ticker"
    "hyprworm"
    "waycorner"
    "waybar"
    "eww"
    "xsettingsd"
    "velero"
    "wayscriber"
)

for dir in "${FOLDERS[@]}" ; do
    echo "Stowing $dir"
    stow --restow "$dir" || (echo "Error: Could not stow $dir" && exit 1)
done

if [ ! -L "/etc/pacman.conf" ]; then
    sudo rm -rf /etc/pacman.conf
fi   

# Stow pacman.conf
sudo stow --target=/etc pacman

sudo stow --target=/usr/share/sddm/themes sddm-themes &>/dev/null
sudo stow --target=/etc sddm &>/dev/null