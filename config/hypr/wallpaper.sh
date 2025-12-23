#!/bin/bash
# By lluciocc
# Deps sudo pacman -S jq
DIR="$HOME/Pictures/wallpapers"

menu() {
    find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) \
        | awk '{print "img:"$0}'
}

get_focused_monitor() {
    hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name'
}

main() {
    MONITOR=$(get_focused_monitor)
    [ -z "$MONITOR" ] && exit 1

    choice=$(menu | wofi \
        -c ~/.config/wofi/wallpaper \
        -s ~/.config/wofi/style-wallpaper.css \
        --show dmenu \
        --prompt "Select Wallpaper:" \
        -n)

    selected_wallpaper="${choice#img:}"
    [ -z "$selected_wallpaper" ] && exit 0

    swww img "$selected_wallpaper" \
        --outputs "$MONITOR" \
        --transition-type wave \
        --transition-fps 60 \
        --transition-duration 2
}

main
