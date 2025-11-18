#!/usr/bin/env bash

if [ "$MINIMAL" == false && "$GAMING" == true ]; then
    # Gaming
    yay --noconfirm -S --needed minecraft-launcher mesa nwjs-sdk-bin vulkantools vulkan-icd-loader lib32-vulkan-icd-loader \
        ttf-liberation steamcmd steam wine winetricks vesktop-bin lutris lutris-wine-meta bottles wine-mono wine-gecko
fi