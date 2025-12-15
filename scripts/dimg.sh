#!/usr/bin/env bash
# Simple script to download image an place it to the right folder
# Made to work with my wofi wallpaper manager :)
# Usage: dimg <url> [filename]

if [[ -z "$1" ]]; then
    echo "Error: missing URL"
    echo "Usage: dimg <url> [filename]"
    exit 1
fi

URL="$1"
FILENAME="$2"
DEST="$HOME/Pictures/wallpapers"

if ! mkdir -p "$DEST"; then
    echo "Error: failed to create directory $DEST"
    exit 2
fi

if ! cd "$DEST"; then
    echo "Error: failed to access directory $DEST"
    exit 2
fi

EXT="${URL##*.}"
EXT="${EXT%%\?*}"

if [[ -n "$FILENAME" ]]; then
    if [[ "$FILENAME" != *.* ]]; then
        FILENAME="$FILENAME.$EXT"
    fi
    if ! wget -O "$FILENAME" "$URL"; then
        echo "Error: download failed"
        exit 3
    fi
else
    if ! wget "$URL"; then
        echo "Error: download failed"
        exit 3
    fi
fi
