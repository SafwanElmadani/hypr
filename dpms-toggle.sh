#!/usr/bin/env bash
hyprctl dispatch 'hl.dsp.dpms({ action = "off" })'
sleep 1
hyprctl dispatch 'hl.dsp.dpms({ action = "on" })'
