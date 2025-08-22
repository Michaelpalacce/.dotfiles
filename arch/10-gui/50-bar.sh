
#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    # Explicit dependencies
    yay --noconfirm -S --needed ags-hyprpanel-git wireplumber libgtop bleuz bluez-utils networkmanager dart-sass wl-clipboard upower gvfs gtksourceview3 libsoup3
    # Optional
    yay --noconfirm -S --needed python python-gpustat brightnessctl pywal pacman-contrib power-profiles-daemon grimblast wf-recordr hyprpicker hyprsunset btop matugen swww
fi
