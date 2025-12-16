#!/usr/bin/env bash

if [[ "$MINIMAL" == false ]]; then
    # Printing: https://wiki.archlinux.org/title/CUPS
    # cups for drivers
    # Avahi for mdns
    # SETTING UP: https://github.com/OpenPrinting/cups/?tab=readme-ov-file#setting-up-printers
    # http://localhost:631/admin/
    yay --noconfirm -S --needed cups cups-pdf ghostscript gsfonts

    sudo systemctl start cups
    sudo systemctl enable cups
fi