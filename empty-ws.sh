#!/bin/bash

# Find the smallest positive workspace ID that is not currently in use
NEXT_WORKSPACE=$(hyprctl workspaces -j | jq '[.[].id] as $ids | first(range(1; (($ids | max) // 0) + 2) | select(. as $n | $ids | index($n) | not))')

# Dispatch to the new workspace
hyprctl dispatch workspace $NEXT_WORKSPACE
