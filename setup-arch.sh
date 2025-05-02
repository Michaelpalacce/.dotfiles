#!/usr/bin/env bash

# For now it's just a big collection of stuff I needed... There is a lot more in terms of configuration of course

sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git --noconfirm

# Check if yay is already installed.
if ! command -v yay &> /dev/null; then
  echo "Installing yay."
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
else
  echo "yay is already installed."
fi

sudo pacman --noconfirm -Su vlc nfs-utils veracrypt waybar ttf-font-awesome \
    ninja gcc wayland-protocols libjpeg-turbo libwebp libjxl pango cairo \
    pkgconf cmake libglvnd hyprpaper meson gtk4 gobject-introspection libgirepository \
    gtk-doc

yay --noconfirm -Su mupdf catpuccin-gtk-theme-mocha nwg-look brightnessctl hypridle hyprlock hyprshot \
    nautilus ttf-liberation steamcmd steam wine winetricks proton-cacyos cmake cpio pkg-config \
    gtkmm3 jsoncpp libsigc++ fmt chroon-date spdlog libgtk-3-dev alsa-utils hyprpicker python python-pip

yay --noconfirm -Su minecraft-launcher
