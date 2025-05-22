#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

m=$(echo $NAME | sed -e 's/aerospaceapps_monitor\-\([0-9]*\)\-\([0-9]*\)/\1/')
d=$(echo $NAME | sed -e 's/aerospaceapps_monitor\-\([0-9]*\)\-\([0-9]*\)/\2/')
FOCUSED_SPACE=$(aerospace list-workspaces --monitor $m --visible)
WINDOWS=$(aerospace list-windows --workspace $FOCUSED_SPACE --format %{window-id}_\"%{app-name}\"_\"%{window-title}\")
FOCUSED_WINDOW=$(aerospace list-windows --focused --format %{window-id}_\"%{app-name}\"_\"%{window-title}\")

ALL_SKETCHYBAR_ITEMS=$(sketchybar --query bar | jq .items | tr -d '[],"' | xargs)
ALLOWED_WINDOW_IDS=$(echo "$WINDOWS" | sed -e 's/\([0-9][0-9]*\)_"\(..*\)"_"\(..*\)"/\1/' | xargs)

for item in $ALL_SKETCHYBAR_ITEMS ; do
    if [[ $item =~ "${NAME}_app" ]]; then
        wid=$(echo "$item" | sed -e 's/aerospaceapps_monitor.*_app\-\([0-9][0-9]*\)/\1/')

        if [[ ! " ${ALLOWED_WINDOW_IDS[*]} " =~ " $wid " ]]; then
            sketchybar --remove $item
        fi
    fi
done

while read w; do
    color=$WHITE

    if [ "$w" == "$FOCUSED_WINDOW" ]; then
        color=$HOTPINK
    fi

    wid=$(echo $w | sed -e 's/\([0-9][0-9]*\)_"\(..*\)"_"\(..*\)"/\1/')
    wapp=$(echo $w | sed -e 's/\([0-9][0-9]*\)_"\(..*\)"_"\(..*\)"/\2/')
    wtitle=$(echo $w | sed -e 's/\([0-9][0-9]*\)_"\(..*\)"_"\(..*\)"/\3/')

    window=(
  		display=$d
  		# icon=$s
  		label="[$wapp]$wtitle"
        scroll_texts=on
  		background.padding_left=-2
  		background.padding_right=-2
  		label.padding_left=8
  		label.padding_right=8
  		# label.font="sketchybar-app-font:Regular:16.0"
  		# label.background.height=26
  		label.background.drawing=off
  		label.background.color=$BACKGROUND_2
  		# label.drawing=off
        icon.color=$color
        label.color=$color
        label.max_chars=30
        label.scroll_duration=2000
        # click_script="aerospace workspace $s"
    )

    sketchybar --add item ${NAME}_app-${wid} left \
        --set ${NAME}_app-${wid} "${window[@]}"

    sketchybar --move ${NAME}_space-${s} after ${NAME}

done <<< "$WINDOWS"
