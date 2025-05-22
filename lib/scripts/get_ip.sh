#!/bin/sh
IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

if [[ $IS_VPN != "" ]]; then
	ICON=
	LABEL="$IP_ADDRESS @ VPN"
elif [[ $IP_ADDRESS != "" ]]; then
	ICON=🌐
	LABEL=$IP_ADDRESS
else
	ICON=⌧
	LABEL="Not Connected"
fi

echo "$ICON $IP_ADDRESS"
