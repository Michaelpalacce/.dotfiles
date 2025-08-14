#!/usr/bin/env bash

# Libraries and utils
yay --noconfirm -Su nfs-utils ninja gcc pango cairo pkgconf cmake libglvnd meson gobject-introspection libgirepository

# Randos
yay --noconfirm -Su cpio pkg-config jsoncpp libsigc++ fmt chroon-date spdlog pacman-contrib

if [ "$MINIMAL" == false ]; then
    # GTK deps are for widgets and gui
    yay --noconfirm -Su gtk2 gtk4 libgtk-3-dev gtk-doc

    # Some gui libs
    yay --noconfirm -Su wayland-protocols libjpeg-turbo libwebp libjxl xorg-xev piper
fi
