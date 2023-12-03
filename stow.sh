#!/usr/bin/env bash
# ANSI color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No color

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

FOLDERS=("nvim" "editorconfig" "sh" "tmux" "bin")


if ! command_exists stow; then
    print_color "$GREEN" "stow not found, installing"
    sudo apt install stow -y
else
    print_color "$YELLOW" "stow exists, skipping"
fi

for dir in ${FOLDERS[@]} ; do
    echo "stow $dir"
    stow $dir
done
