#!/usr/bin/env bash

if [[ "$MINIMAL" == false ]]; then
    # File Manager
    yay --noconfirm -S --needed nautilus nautilus-open-any-terminal nautilus-launch actions-for-nautilus-git sushi

    # File Preview 
    yay --noconfirm -S --needed ffmpegthumbnailer gst-libav gst-plugins-ugly

    # File Utils
    # transmission-gtk3 for torrenting
    # unzup and file-roller for archiving
    yay --noconfirm -S --needed transmission-gtk3 unzip file-roller
fi