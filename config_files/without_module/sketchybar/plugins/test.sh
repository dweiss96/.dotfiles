#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

NAME='aerospaceapps_monitor-1-1'

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
            echo "remove"
        fi
    fi
done
