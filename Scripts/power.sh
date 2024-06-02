#2 let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]"!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5
## style-6   style-7   style-8   style-9   style-10

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-2"
theme='style-5'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
#󰌾
hibernate=''
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
		-theme ${dir}/${theme}.rasi
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
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$hibernate\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			canberra-gtk-play -f /usr/share/sounds/ubuntu/stereo/desktop-logout.ogg && systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			canberra-gtk-play -f /usr/share/sounds/ubuntu/stereo/desktop-logout.ogg && systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
        # elif [[ $1 == '--hibernate' ]]; then
        #     canberra-gtk-play -f /usr/share/sounds/ubuntu/stereo/desktop-logout.ogg && systemctl hibernate
		elif [[ $1 == '--logout' ]]; then
			if [[ "$XDG_SESSION_DESKTOP" == 'openbox' ]]; then
				openbox --exit
			elif [[ "$XDG_SESSION_DESKTOP" == 'bspwm' ]]; then
				bspc quit
			elif [[ "$XDG_SESSION_DESKTOP" == 'i3' ]]; then
				i3-msg exit
			elif [[ "$XDG_SESSION_DESKTOP" == 'hyprland' ]]; then
				canberra-gtk-play -f /usr/share/sounds/ubuntu/stereo/service-logout.ogg && hyprctl dispatch exit
			elif [[ "$XDG_SESSION_DESKTOP" == 'plasma' ]]; then
				qdbus org.kde.ksmserver /KSMServer logout 0 0 0
			fi
		fi
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
		xscreensaver-command -lock
		if [[ -x '/usr/bin/betterlockscreen' ]]; then
			betterlockscreen -l
		elif [[ -x '/usr/bin/i3lock' ]]; then
			i3lock
		fi
        canberra-gtk-play -f /usr/share/sounds/MIUI/stereo/desktop-screen-lock.ogg &&
		swaylock
        ;;

  #   $hibernate)
		# run_cmd --hibernate
  #       ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
