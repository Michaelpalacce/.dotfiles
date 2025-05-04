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

sudo pacman --noconfirm -Su vlc nfs-utils veracrypt ninja gcc wayland-protocols libjpeg-turbo libwebp libjxl pango cairo \
    pkgconf cmake libglvnd meson gtk4 gobject-introspection libgirepository \
    gtk-doc rustup cargo

yay --noconfirm -Su waybar ttf-font-awesome

# Needed for rust builds (rustdesk for example)
rustup default stable

yay --noconfirm -Su mupdf cpio pkg-config jsoncpp libsigc++ fmt chroon-date spdlog libgtk-3-dev alsa-utils python python-pip \
    piper xorg-xev 

# look
yay --noconfirm -Su swww catpuccin-gtk-theme-mocha nwg-look gtkmm3 qt6-svg qt6-declarative qt5-quickcontrols2

# audio
yay --noconfirm -Su pipewire pipewire-pulse wireplumber pavucontrol

# hyprland utils
yay --noconfirm -Su hyprutils hyprgraphics qt5-wayland qt6-wayland xdg-desktop-portal-hyprland waypaper \
    hyprpolkitagent hyprsysteminfo hypridle hyprlock hyprshot hyprpicker 

# File Manager
yay --noconfirm -Su nautilus nautilus-admin-gtk4 nautilus-image-converter nautilus-open-any-terminal

# Gaming
yay --noconfirm -Su minecraft-launcher \
    ttf-liberation steamcmd steam wine winetricks proton-cacyos

# Flatpak cause I am a baby
yay --noconfirm -Su flatpak
