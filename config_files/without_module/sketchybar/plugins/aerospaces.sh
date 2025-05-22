#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

m=$(echo $NAME | sed -e 's/aerospaces_monitor\-\([0-9]*\)\-\([0-9]*\)/\1/')
d=$(echo $NAME | sed -e 's/aerospaces_monitor\-\([0-9]*\)\-\([0-9]*\)/\2/')
SPACES=$(aerospace list-workspaces --monitor $m)
FOCUSED_SPACE=$(aerospace list-workspaces --monitor $m --visible)


# ALL_SKETCHYBAR_SPACES=$(sketchybar --query bar | jq .items | tr -d '[],"' | xargs)
# ALLOWED_WINDOW_IDS=$(echo "$WINDOWS" | sed -e 's/\([0-9][0-9]*\)_"\(..*\)"_"\(..*\)"/\1/' | xargs)

# for item in $ALL_SKETCHYBAR_ITEMS ; do
#     if [[ $item =~ "${NAME}_app" ]]; then
#         wid=$(echo "$item" | sed -e 's/aerospaceapps_monitor-\([0-9][0-9]*\)/\1/')

#         if [[ ! " ${ALLOWED_WINDOW_IDS[*]} " =~ " $wid " ]]; then
#             sketchybar --remove $item
#         fi
#     fi
# done

for s in $SPACES; do
    WINDOWCOUNT=$(aerospace list-windows --workspace $s --count)

    if [ $WINDOWCOUNT -gt 0 ] || [ $FOCUSED_SPACE == $s ]; then
        color=$WHITE
        if [ $s == $FOCUSED_SPACE ]; then
            color=$HOTPINK
        fi

        space=(
      		display=$d
      		# icon=$s
      		label=$s
      		background.padding_left=-2
      		background.padding_right=-2
      		label.padding_left=8
      		label.padding_right=8
      		# label.font="sketchybar-app-font:Regular:16.0"
      		label.background.height=26
      		label.background.drawing=on
      		label.background.color=$BACKGROUND
      		label.background.corner_radius=8
      		# label.drawing=off
            icon.color=$color
            label.color=$color
            click_script="aerospace workspace $s"
        )

        sketchybar --add item ${NAME}_space-${s} left \
            --set ${NAME}_space-${s} "${space[@]}"

        sketchybar --move ${NAME}_space-${s} before ${NAME}
    fi
done
