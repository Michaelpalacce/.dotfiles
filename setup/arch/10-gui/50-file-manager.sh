#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    # File Manager
    yay --noconfirm -S --needed nautilus nautilus-admin-gtk4 nautilus-image-converter nautilus-open-any-terminal unzip \
        transmission-gtk3 nautilus-annotations nautilus-checksums nautilus-hide nautilus-launch actions-for-nautilus-git \
        folder-color-nautilus nautilus-metadata-editor nautilus-share seahorse-nautilus sushi file-roller

    # File Preview 
    yay --noconfirm -S --needed ffmpegthumbnailer gst-libav gst-plugins-ugly
fi
