#!/bin/bash

option0="Lock"
option1="Suspend"
option2="Logout"
option3="Reboot"
option4="Shutdown"

# Panggil Rofi dengan config KHUSUS powermenu.rasi
options="$option0\n$option1\n$option2\n$option3\n$option4"
chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -config ~/.config/rofi/powermenu.rasi)"

case $chosen in
    $option0)
        pidof hyprlock || hyprlock
        ;;
    $option1)
        systemctl suspend
        ;;
    $option2)
        loginctl terminate-user $USER
        ;;
    $option3)
        systemctl reboot
        ;;
    $option4)
        systemctl poweroff
        ;;
esac
