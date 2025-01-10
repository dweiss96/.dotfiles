source "$HOME/.config/sketchybar/colors.sh"

sketchybar --add item ip_address right \
	--set ip_address script="$PLUGIN_DIR/ip_address.sh" \
	update_freq=30 \
	padding_left=2 \
	padding_right=8 \
	background.border_width=0 \
	background.corner_radius=6 \
	background.height=24 \
	icon.color=$WHITE \
	label.color=$WHITE
	--subscribe ip_address wifi_change
