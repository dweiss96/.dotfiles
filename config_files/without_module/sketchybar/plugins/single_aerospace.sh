#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

m=$(echo $NAME | sed 's/aerospaces_monitor-//')
SPACES=$(aerospace list-workspaces --monitor $m)
FOCUSED_SPACE=$(aerospace list-workspaces --monitor $m --visible)

# sketchybar --remove /${NAME}_space.*/

for s in $SPACES; do

    color=$WHITE
    if [ $s == $FOCUSED_SPACE ]; then
        color=$HOTPINK
    fi

    space=(
  		display=$m
  		icon=$s
  		label.padding_right=20
  		# label.font="sketchybar-app-font:Regular:16.0"
  		label.background.height=26
  		label.background.drawing=on
  		label.background.color=$BACKGROUND_2
  		label.background.corner_radius=8
  		label.drawing=off
        icon.color=$color
        click_script="aerospace workspace $s"
    )

    sketchybar --add item ${NAME}_space-${s} left \
        --set ${NAME}_space-${s} "${space[@]}"
done
