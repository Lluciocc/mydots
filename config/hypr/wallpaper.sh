#!/bin/bash
# By lluciocc
DIR="$HOME/Pictures/wallpapers"
menu() {
    find "${DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}
main() {
    choice=$(menu | wofi -c ~/.config/wofi/wallpaper -s ~/.config/wofi/style-wallpaper.css --show dmenu --prompt "Select Wallpaper:" -n)
    selected_wallpaper=$(echo "$choice" | sed 's/^img://')
    swww img "$selected_wallpaper" --transition-type wave --transition-fps 60 --transition-duration 2
}
main
