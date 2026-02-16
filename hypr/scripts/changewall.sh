#!/bin/bash

CACHE_FILE="$HOME/.cache/current_wallpaper"
DEFAULT_WALL="/home/faried/Pictures/Wallpapers/wallpaper-main.jpeg"

if [ -n "$1" ]; then
    WALLPAPER="$1"
    echo "$WALLPAPER" > "$CACHE_FILE"

else
    if [ -f "$CACHE_FILE" ]; then
        WALLPAPER=$(cat "$CACHE_FILE")
    else
        WALLPAPER="$DEFAULT_WALL"
    fi
fi

if [ ! -f "$WALLPAPER" ]; then
    WALLPAPER="$DEFAULT_WALL"
fi


if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon --format xrgb &
    sleep 1
fi

swww img "$WALLPAPER" --transition-type grow --transition-pos 0.9,0.9 --transition-step 90 --transition-fps 60 &> /dev/null

# Generate Color 
matugen image "$WALLPAPER"

# Reload Waybar & Swaync
pkill swaync
pkill waybar
sleep 0.5
swaync & disown
waybar & disown

# 4. Reload Hyprland
hyprctl reload

