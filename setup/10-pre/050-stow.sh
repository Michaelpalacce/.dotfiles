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
    "agents"
    "desktop"
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

# Claude Code only discovers skills in ~/.claude/skills, so point it at the
# stowed ~/.agents/skills. ~/.claude holds runtime state, so link the subdir only.
if [ -d "$HOME/.claude/skills" ] && [ ! -L "$HOME/.claude/skills" ]; then
    echo "Warning: $HOME/.claude/skills is a real directory, not linking to ~/.agents/skills"
else
    mkdir -p "$HOME/.claude"
    ln -sfn "$HOME/.agents/skills" "$HOME/.claude/skills"
fi

if [ ! -L "/etc/pacman.conf" ]; then
    sudo rm -rf /etc/pacman.conf
fi   

# Stow pacman.conf
sudo stow --target=/etc pacman

sudo stow --target=/usr/share/sddm/themes sddm-themes &>/dev/null
sudo stow --target=/etc sddm &>/dev/null