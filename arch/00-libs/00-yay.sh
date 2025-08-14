#!/usr/bin/env bash

sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git --noconfirm

# Check if yay is already installed.
if ! command -v yay &> /dev/null; then
  echo "Installing yay."
  pushd $HOME 
      git clone https://aur.archlinux.org/yay.git

      pushd yay > /dev/null || {
        echo "Failed to enter the yay directory.  Exiting."
        exit 1
      }

      makepkg -si --noconfirm

      popd > /dev/null || {
        echo "Failed to return to the previous directory."
        exit 1
      }
  popd
else
  echo "yay is already installed."
fi
