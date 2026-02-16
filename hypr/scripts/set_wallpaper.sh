#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_image>"
    exit 1
fi

IMG_PATH="$1"
CONF_FILE="$HOME/.config/hypr/hyprpaper.conf"

# Update wallpaper
echo "preload = $IMG_PATH" > $CONF_FILE
echo "wallpaper = , $IMG_PATH" >> $CONF_FILE
echo "splash = false" >> $CONF_FILE

# Apply changes
hyprctl hyprpaper preload "$IMG_PATH"
# Set wallpaper
hyprctl hyprpaper wallpaper ",$IMG_PATH"
