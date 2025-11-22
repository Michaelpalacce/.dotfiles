#!/usr/bin/env bash


if [[ "$MINIMAL" == false ]]; then
    # System Resources
    yay --noconfirm -S --needed resources gnome-system-monitor
fi

# Security
yay --noconfirm -S --needed firejail ufw ufw-docker sops age trivy-bin