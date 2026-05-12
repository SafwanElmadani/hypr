#!/bin/bash

# Open the smallest positive workspace id that isn't currently assigned to
# any monitor, so Hyprland creates it on the focused monitor instead of
# switching to an existing workspace on another output.
# Falls back to Hyprland's "emptyn" if jq is missing.
if ! command -v jq >/dev/null 2>&1; then
    hyprctl dispatch 'hl.dsp.focus({ workspace = "emptyn" })'
    exit 0
fi

existing=$(hyprctl workspaces -j | jq -r '.[].id' | sort -n)

n=1
for id in $existing; do
    [ "$id" -lt 1 ] && continue
    if [ "$id" -eq "$n" ]; then
        n=$((n + 1))
    elif [ "$id" -gt "$n" ]; then
        break
    fi
done

hyprctl dispatch "hl.dsp.focus({ workspace = \"$n\" })"
