#!/bin/bash

# Get the ID of the highest existing workspace
LAST_WORKSPACE=$(hyprctl workspaces -j | jq 'map(.id) | max')

# If no workspaces exist (unlikely), start at 1
if [ "$LAST_WORKSPACE" == "null" ]; then
    NEXT_WORKSPACE=1
else
    NEXT_WORKSPACE=$((LAST_WORKSPACE + 1))
fi

# Dispatch to the new workspace
hyprctl dispatch workspace $NEXT_WORKSPACE
