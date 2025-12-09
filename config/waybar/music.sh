# only tested on spotify, Lluciocc original script

player=$(playerctl -l 2>/dev/null | head -n 1)

status=$(playerctl --player="$player" status 2>/dev/null)

if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
    title=$(playerctl --player="$player" metadata title 2>/dev/null)
    artist=$(playerctl --player="$player" metadata artist 2>/dev/null)

    pos=$(playerctl --player="$player" position 2>/dev/null)
    dur=$(playerctl --player="$player" metadata mpris:length 2>/dev/null)

    format_time() {
        secs=$(printf "%.0f" "$1")
        printf "%02d:%02d" "$((secs / 60))" "$((secs % 60))"
    }

    if [[ "$pos" != "" ]]; then
        pos_fmt=$(format_time "$pos")
    else
        pos_fmt="--:--"
    fi

    if [[ "$dur" != "" ]]; then
        dur_fmt=$(format_time "$(echo "$dur / 1000000" | bc)")
    else
        dur_fmt="--:--"
    fi

    if [ "$status" = "Playing" ]; then
        icon=""
    else
        icon=""
    fi

    if [ -z "$title" ] && [ -z "$artist" ]; then
        echo ""
    else
        echo "  $title - $artist $icon [$pos_fmt/$dur_fmt]"
    fi
else
    window=$(hyprctl activewindow -j | jq -r '.class')

    if [ "$window" = "null" ]; then
        echo ""
    else
        echo "$window"
    fi
fi
