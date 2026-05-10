#!/usr/bin/env bash
# Usage: lid.sh open|close
case "$1" in
  close)
    hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = true })'
    ;;
  open)
    hyprctl reload
    ;;
  *)
    echo "usage: $0 open|close" >&2
    exit 2
    ;;
esac
