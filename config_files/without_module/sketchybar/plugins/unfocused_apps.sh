#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

CURRENT_WINDOW=$(yabai -m query --windows --window | jq '.id')
WINDOWS=$(yabai -m query --windows | jq '.[].app')
# OTHER_WINDOWS=$(yabai -m query --windows | jq --arg CURRENT_WINDOW $CURRENT_WINDOW 'map(select( .id != ($CURRENT_WINDOW | tonumber))) | .[].app')
OTHER_WINDOWS=$(yabai -m query --windows --space | jq -r --arg CURRENT_WINDOW $CURRENT_WINDOW 'map(select( .id != ($CURRENT_WINDOW | tonumber)) | .app) | join(" | ")')


# echo $CURRENT_WINDOW
# echo $OTHER_WINDOWS
# echo $OWS

sketchybar --set $NAME label="$OTHER_WINDOWS"

