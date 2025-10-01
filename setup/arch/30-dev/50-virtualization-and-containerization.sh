#!/usr/bin/env bash

# Virtualization and Containerization
yay --noconfirm -S --needed docker docker-compose docker-buildx

if [ "$MINIMAL" == false ]; then
    yay --noconfirm -S --needed nftables-git qemu-full libvirt virt-manager-git

    # Running Windows stuf in Linux
    yay --noconfirm -S --needed winboat
fi