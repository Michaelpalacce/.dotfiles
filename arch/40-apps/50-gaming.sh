#!/usr/bin/env bash


if [ "$MINIMAL" == false ]; then
    # Gaming
    yay --noconfirm -Su minecraft-launcher mesa nwjs-sdk-bin vulkantools vulkan-icd-loader lib32-vulkan-icd-loader \
        ttf-liberation steamcmd steam wine winetricks proton-cacyos discord lutris lutris-wine-meta bottles wine-mono wine-gecko
fi

