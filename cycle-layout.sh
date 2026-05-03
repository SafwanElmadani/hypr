#!/bin/bash

# Get current workspace ID
WS_ID=$(hyprctl activeworkspace -j | jq -r '.id')

# Per-workspace layout state file
STATE_DIR="/tmp/hypr-layout"
STATE_FILE="$STATE_DIR/ws-$WS_ID"
mkdir -p "$STATE_DIR"

# Read current layout for this workspace (default to dwindle on first run)
CURRENT_LAYOUT=$(cat "$STATE_FILE" 2>/dev/null || echo "dwindle")

# Cycle: dwindle -> master -> scrolling -> monocle -> dwindle
case "$CURRENT_LAYOUT" in
    "dwindle")
        NEXT="master"
        ICON="input-mouse"
        ;;
    "master")
        NEXT="scrolling"
        ICON="media-playlist-repeat"
        ;;
    "scrolling")
        NEXT="monocle"
        ICON="view-fullscreen"
        ;;
    *) # monocle or unknown
        NEXT="dwindle"
        ICON="input-keyboard"
        ;;
esac

# Persist new layout for this workspace
echo "$NEXT" > "$STATE_FILE"

# Apply the layout rule only to the focused workspace
hyprctl keyword workspace "$WS_ID, layout:$NEXT"

# Visual notification
notify-send "Workspace $WS_ID" "Layout: ${NEXT^^}" -i "$ICON" -t 1500
