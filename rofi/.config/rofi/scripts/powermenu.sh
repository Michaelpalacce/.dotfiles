#!/usr/bin/env bash

## Author : Adapted for Hyprland by Craack
## Original : Aditya Shakya (adi1090x)

# Current Theme
dir="$HOME/.config/rofi/"
theme='powermenu'

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"

# Options (Nerd Font icons)
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-theme "${dir}/${theme}.rasi"
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you sure?' \
		-theme "${dir}/${theme}.rasi"
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		case $1 in
			--shutdown) systemctl poweroff ;;
			--reboot) systemctl reboot ;;
			--suspend)
				systemctl suspend
				;;
			--logout)
				hyprctl dispatch exit 0
				;;
		esac
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		if command -v hyprlock &>/dev/null; then
			hyprlock
		else
			notify-send "Hyprland" "hyprlock not installed"
		fi
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac