
# only tested on spotify, Lluciocc original script
# The script is returning something like that
# [(Title) - (Artist) (paused or playing) (Time)] -> wtf even me i don't understand
# Example: 
# I Ain't Worried - OneRepublic  [01:24/02:28]

layer=$(playerctl -l 2>/dev/null | head -n 1)
status=$(playerctl --player="$player" status 2>/dev/null)

if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
    title=$(playerctl --player="$player" metadata title 2>/dev/null)
    artist=$(playerctl --player="$player" metadata artist 2>/dev/null)

    pos=$(playerctl --player="$player" position 2>/dev/null)

    dur=$(playerctl --player="$player" metadata mpris:length 2>/dev/null)

    format_time() {
        secs=$1
        printf "%02d:%02d" $((secs / 60)) $((secs % 60))
    }

    if [[ "$pos" != "" ]]; then
        pos_sec=$(printf "%.0f" "$pos")
        pos_fmt=$(format_time "$pos_sec")
    else
        pos_fmt="--:--"
    fi

    if [[ "$dur" != "" && "$dur" != "0" ]]; then
        dur_sec=$((dur / 1000000))
        dur_fmt=$(format_time "$dur_sec")
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
