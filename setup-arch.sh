#!/usr/bin/env bash

# For now it's just a big collection of stuff I needed... There is a lot more in terms of configuration of course

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

sudo pacman --noconfirm -Su nfs-utils veracrypt ninja gcc wayland-protocols libjpeg-turbo libwebp libjxl pango cairo \
    pkgconf cmake libglvnd meson gtk4 gobject-introspection libgirepository \
    gtk-doc rustup cargo

# Waybar and fonts
yay --noconfirm -Su waybar ttf-font-awesome ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols-mono noto-fonts noto-fonts-cjk noto-fonts-emoji

# Needed for rust builds (rustdesk for example)
rustup default stable

yay --noconfirm -Su mupdf cpio pkg-config jsoncpp libsigc++ fmt chroon-date spdlog libgtk-3-dev alsa-utils python python-pip \
    piper xorg-xev sof-firmware lib32-nvidia-utils nvidia-open pacman-contrib

# Networking
yay --noconfirm -Su networkmanager networkmanager-dmenu-git

# System Resources
yay --noconfirm -Su resources

# Security
yay --noconfirm -Su firejail

# Notifications
yay --noconfirm -Su swaync

# Logout
yay --noconfirm -Su wlogout

# Look
yay --noconfirm -Su swww catpuccin-gtk-theme-mocha nwg-look gtkmm3 qt6-svg qt6-declarative qt5-quickcontrols2 waycorner

# Audio
yay --noconfirm -Su pipewire pipewire-pulse wireplumber pavucontrol lib32-pipewire

# Video
yay --noconfirm -Su gifski vlc

# hyprland utils
yay --noconfirm -Su hyprutils hyprgraphics qt5-wayland qt6-wayland xdg-desktop-portal-hyprland waypaper \
    hyprpolkitagent hyprsysteminfo hypridle hyprlock hyprshot hyprpicker lm_sensors

# File Manager
yay --noconfirm -Su nautilus nautilus-admin-gtk4 nautilus-image-converter nautilus-open-any-terminalunzip \
    transmission-gtk3 nautilus-annotations nautilus-bluetooth nautilus-checksums nautilus-hide nautilus-launch actions-for-nautilus-git \
    folder-color-nautilus nautilus-metadata-editor nautilus-share seahorse-nautilus sushi file-roller

# File Preview 
yay --noconfirm -Su ffmpegthumbnailer gst-libav gst-plugins-ugly

# Gaming
yay --noconfirm -Su minecraft-launcher \
    ttf-liberation steamcmd steam wine winetricks proton-cacyos discord lutris lutris-wine-meta bottles

# Flatpak cause I am a baby
yay --noconfirm -Su flatpak

# Browser
yay --noconfirm -Su brave-bin

# Dev
yay --noconfirm -Su tmux zsh stow postman-bin

# PKM
yay --noconfirm -Su obsidian
