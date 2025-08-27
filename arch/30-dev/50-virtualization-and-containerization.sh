#!/usr/bin/env bash

# Virtualization and Containerization
yay --noconfirm -S --needed docker docker-compose docker-buildx

if [ "$MINIMAL" == false ]; then
    yay --noconfirm -S --needed qemu-full libvirt virt-manager-git
fi
