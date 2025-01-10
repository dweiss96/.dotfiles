#!/bin/bash

update() {
	WIDTH="0"
	# WIDTH="dynamic"
	if [ "$SELECTED" = "true" ]; then
		WIDTH="0"
	fi

	sketchybar --animate tanh 20 --set $NAME icon.highlight=$SELECTED label.width=$WIDTH
}

mouse_clicked() {
	if [ "$BUTTON" = "right" ]; then
		yabai -m space --destroy $SID
		sketchybar --trigger space_change --trigger windows_on_spaces
	else
		index=$SID
		eval "$(yabai -m query --spaces | jq --argjson index "${index}" -r '(.[] | select(.index == $index).windows[0]) as $wid | if $wid then "yabai -m window --focus \"" + ($wid | tostring) + "\"" else "skhd --key \"ctrl - " + (map(select(."is-native-fullscreen" == false)) | index(map(select(.index == $index))) + 1 % 10 | tostring) + "\"" end')"
		yabai -m space --focus $SID 2>/dev/null
	fi
}

case "$SENDER" in
"mouse.clicked")
	mouse_clicked
	;;
*)
	update
	;;
esac
