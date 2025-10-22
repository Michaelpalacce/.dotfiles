#!/usr/bin/env bash

# Libraries and utils
yay --noconfirm -S --needed nfs-utils ninja gcc pango cairo pkgconf cmake libglvnd meson gobject-introspection libgirepository

# Randos
yay --noconfirm -S --needed cpio pkg-config jsoncpp libsigc++ fmt spdlog pacman-contrib

# Documentation
yay --noconfirm -S --needed man-db

# Utils
yay --noconfirm -S btop

# Clipboard
yay --noconfirm -S cliphist

if [ "$MINIMAL" == false ]; then
    # GTK deps are for widgets and gui
    yay --noconfirm -S --needed gtk2 gtk4 gtk-doc

    # Some gui libs
    yay --noconfirm -S --needed wayland-protocols libjpeg-turbo libwebp libjxl xorg-xev piper
fi