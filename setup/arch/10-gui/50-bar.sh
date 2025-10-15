
#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    # Waybar
    yay --noconfirm -S --needed waybar swaync

    # # Explicit dependencies for Hyprpanel
    # yay -S --needed aylurs-gtk-shell-git wireplumber libgtop bluez bluez-utils btop networkmanager dart-sass wl-clipboard brightnessctl swww python upower pacman-contrib power-profiles-daemon gvfs gtksourceview3 libsoup3 grimblast-git wf-recorder-git hyprpicker matugen-bin python-gpustat hyprsunset-git
    #
    # # Hyprpanel
    # yay -S --needed ags-hyprpanel-git
fi