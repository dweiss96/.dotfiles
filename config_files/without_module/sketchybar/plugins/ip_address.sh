#!/bin/sh
source "$HOME/.config/sketchybar/colors.sh"

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

if [[ $IS_VPN != "" ]]; then
	COLOR=$BLUE_TRANSPARENT
	ICON=
	LABEL="$IP_ADDRESS @ VPN"
elif [[ $IP_ADDRESS != "" ]]; then
	COLOR=$TRANSPARENT
	ICON=🌐
	LABEL=$IP_ADDRESS
else
	COLOR=$WINERED
	ICON=⌧
	LABEL="Not Connected"
fi

sketchybar --set $NAME background.color=$COLOR \
	icon=$ICON \
	label="$LABEL"
