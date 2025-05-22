#!/bin/bash
# workaround since aerospaces %{monitor-appkit-nsscreen-screens-id} does not match sketchybar IDs
# defines AEROSPACE_SKETCHYBAR_MONITOR_MATCHER to be read by spaces and apps items
AEROSPACE_SKETCHYBAR_MONITOR_MATCHER=$(aerospace list-monitors --format %{monitor-id}-%{monitor-appkit-nsscreen-screens-id} | xargs)

AEROSPACE_OUTPUT=$(aerospace list-monitors --format %{monitor-id}-%{monitor-appkit-nsscreen-screens-id}-%{monitor-name} | tr ' ' '_' | xargs | tr ' ' '|')
SKETCHYBAR_OUTPUT=$(sketchybar --query displays | jq '. | map("\(.["arrangement-id"])-\(.UUID)")' | tr -d '[], ' | xargs | tr ' ' '|')

combined=$(echo "$AEROSPACE_OUTPUT<>$SKETCHYBAR_OUTPUT")

if [ "$combined" == "1-1-Built-in_Retina_Display|2-2-HP_ZR2440w_(1)|3-3-HP_ZR2440w_(2)<>1-37D8832A-2D66-02CA-B9F7-8F30A301B230|2-C4CBBFD9-D8FE-467C-BCC5-3E2E7E1453EB|3-2417C97A-C0E6-4EC9-9DA1-3B57D9AA0A99" ]; then
    AEROSPACE_SKETCHYBAR_MONITOR_MATCHER="1-1 2-3 3-2"
fi
