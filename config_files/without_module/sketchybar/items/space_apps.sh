#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

for m in $AEROSPACE_SKETCHYBAR_MONITOR_MATCHER; do
    m_sketchybar=$(echo $m | sed -e 's/\([0-9]*\)\-\([0-9]*\)/\2/')

    monitor=(
        display=$m_sketchybar
        script="$PLUGIN_DIR/aerospaces_apps.sh"
  		# icon="M$m : "
  		label.drawing=off
    )
    sketchybar --add item aerospaceapps_monitor-$m left \
        --set aerospaceapps_monitor-$m "${monitor[@]}" \
        --subscribe aerospaceapps_monitor-$m aerospace_change_focus \
        --subscribe aerospaceapps_monitor-$m aerospace_change_focus
done
