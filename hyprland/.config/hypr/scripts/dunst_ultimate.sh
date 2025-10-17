#!/bin/bash
# ╭─────────────────────────────────────────────────────────────╮
# │                    Dunst Ultimate Script                    │
# │                 Volume/Brightness Controls                  │
# ╰─────────────────────────────────────────────────────────────╯

# Settings
volume_step=5
brightness_step=10
max_volume=100
notification_timeout=1500
download_album_art=true
show_album_art=true
show_music_in_volume_indicator=true

# Get current volume (0-100)
get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

# Get mute status (yes/no)
get_mute() {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

get_default_sink() {
  pactl get-default-sink
}

# Get current brightness
get_brightness() {
    # Using light (no sudo needed if configured properly)
    light | grep -Po '[0-9]{1,3}' | head -1
}

# Get volume icon based on level and mute
get_volume_icon() {
    volume=$(get_volume)
    mute=$(get_mute)
    if [[ "$volume" -eq 0 || "$mute" == "yes" ]]; then
        echo ""
    elif [[ "$volume" -lt 50 ]]; then
        echo ""
    else
        echo ""
    fi
}

# Brightness icon (always the same)
get_brightness_icon() {
    echo ""
}

# Get album art path for currently playing song
get_album_art() {
    url=$(playerctl -f "{{mpris:artUrl}}" metadata 2>/dev/null)

    if [[ $url == file://* ]]; then
        echo "${url/file:\/\//}"
    elif [[ $url == http* ]] && [[ $download_album_art == "true" ]]; then
        filename="/tmp/$(basename "$url")"
        if [[ ! -f "$filename" ]]; then
            wget -q -O "$filename" "$url"
        fi
        echo "$filename"
    else
        echo ""
    fi
}

# Show volume notification
show_volume_notif() {
    volume=$(get_volume)
    icon=$(get_volume_icon)

    if [[ $show_music_in_volume_indicator == "true" ]]; then
        song=$(playerctl -f "{{title}} - {{artist}}" metadata 2>/dev/null)
        art=""
        [[ $show_album_art == "true" ]] && art=$(get_album_art)
        notify-send -t $notification_timeout \
            -h string:x-dunst-stack-tag:volume_notif \
            -h int:value:$volume \
            -i "$art" \
            "$icon $volume%" \
            "$song"
    else
        notify-send -t $notification_timeout \
            -h string:x-dunst-stack-tag:volume_notif \
            -h int:value:$volume \
            "$icon $volume%"
    fi
}

# Show brightness notification
show_brightness_notif() {
    brightness=$(get_brightness)
    icon=$(get_brightness_icon)
    notify-send -t $notification_timeout \
        -h string:x-dunst-stack-tag:brightness_notif \
        -h int:value:$brightness \
        "$icon $brightness%"
}

# Show music notification
show_music_notif() {
    title=$(playerctl -f "{{title}}" metadata 2>/dev/null)
    artist=$(playerctl -f "{{artist}}" metadata 2>/dev/null)
    album=$(playerctl -f "{{album}}" metadata 2>/dev/null)
    art=""
    [[ $show_album_art == "true" ]] && art=$(get_album_art)
    notify-send -t $notification_timeout \
        -h string:x-dunst-stack-tag:music_notif \
        -i "$art" \
        "$title" \
        "$artist - $album"
}

# Main
case $1 in
    volume_up)
        pactl set-sink-mute @DEFAULT_SINK@ 0
        vol=$(get_volume)
        if (( vol + volume_step > max_volume )); then
          pactl set-sink-volume "$(get_default_sink)" ${max_volume}%
        else
          pactl set-sink-volume "$(get_default_sink)" +${volume_step}%
        fi
        show_volume_notif
        ;;

    volume_down)
      pactl set-sink-volume "$(get_default_sink)" -${volume_step}%
        show_volume_notif
        ;;

    volume_mute)
      pactl set-sink-mute "$(get_default_sink)" toggle
        show_volume_notif
        ;;

    brightness_up)
        brightnessctl set +${brightness_step}%
        show_brightness_notif
        ;;

    brightness_down)
        brightnessctl set ${brightness_step}%-
        show_brightness_notif
        ;;

    next_track)
        playerctl next
        sleep 0.5
        show_music_notif
        ;;

    prev_track)
        playerctl previous
        sleep 0.5
        show_music_notif
        ;;

    play_pause)
        playerctl play-pause
        show_music_notif
        ;;

    *)
        echo "Usage: $0 {volume_up|volume_down|volume_mute|brightness_up|brightness_down|next_track|prev_track|play_pause}"
        ;;
esac