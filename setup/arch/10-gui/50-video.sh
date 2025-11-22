#!/usr/bin/env bash

if [[ "$MINIMAL" == false ]]; then
    # Video
    yay --noconfirm -S --needed gifski vlc \
      vlc-plugin-aalib           \
      vlc-plugin-aom             \
      vlc-plugin-aribb24         \
      vlc-plugin-aribb25         \
      vlc-plugin-ass             \
      vlc-plugin-avahi           \
      vlc-plugin-bluray          \
      vlc-plugin-caca            \
      vlc-plugin-cddb            \
      vlc-plugin-dca             \
      vlc-plugin-dvb             \
      vlc-plugin-dvd             \
      vlc-plugin-ffmpeg          \
      vlc-plugin-firewire        \
      vlc-plugin-gme             \
      vlc-plugin-lirc            \
      vlc-plugin-live555         \
      vlc-plugin-matroska        \
      vlc-plugin-mpeg2           \
      vlc-plugin-mtp             \
      vlc-plugin-musepack        \
      vlc-plugin-quicksync       \
      vlc-plugin-samplerate      \
      vlc-plugin-sdl             \
      vlc-plugin-sftp            \
      vlc-plugin-soxr            \
      vlc-plugin-srt             \
      vlc-plugin-udev            \
      vlc-plugin-upnp            \
      vlc-plugin-x264            \
      vlc-plugin-x265            \
      vlc-plugin-zvbi            \
      vlc-plugins-extra
      # vlc-plugin-fluidsynth
      # vlc-plugin-freetype
      # vlc-plugin-chromecast
      # vlc-plugin-gstreamer
      # vlc-plugin-libsecret
      # vlc-plugin-modplug
      # vlc-plugin-notify
      # vlc-plugin-mad
      # vlc-plugin-mdns
      # vlc-plugin-jack
      # vlc-plugin-kate
      # vlc-plugins-visualization
      # vlc-plugin-smb
      # vlc-plugin-kwallet
      # vlc-plugin-nfs
      # vlc-plugin-svg
fi