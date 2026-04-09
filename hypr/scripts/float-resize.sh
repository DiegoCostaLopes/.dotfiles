#!/bin/bash

if [ "$(hyprctl activewindow -j | jq '.floating')" == "false" ]; then
    hyprctl dispatch togglefloating
    hyprctl dispatch resizeactive exact 1280 720
    hyprctl dispatch centerwindow
else
    hyprctl dispatch togglefloating
fi


