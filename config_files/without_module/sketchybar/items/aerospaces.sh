#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

for m in $AEROSPACE_SKETCHYBAR_MONITOR_MATCHER; do
    m_sketchybar=$(echo $m | sed -e 's/\([0-9]*\)\-\([0-9]*\)/\2/')

    monitor=(
  		display=$m_sketchybar
        script="$PLUGIN_DIR/aerospaces.sh"
  		# icon="M$m : "
  		label.drawing=off
    )
    sketchybar --add item aerospaces_monitor-$m left \
        --set aerospaces_monitor-$m "${monitor[@]}" \
        --subscribe aerospaces_monitor-$m aerospace_change_space
done
