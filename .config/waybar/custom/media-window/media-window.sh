#!/usr/bin/env bash
# Waybar center module: shows the active window title, but a PLAYING track takes
# priority (auto mode). Right-click toggles between:
#   auto   - track when something is Playing, otherwise the window title
#   window - always the window title (ignore music)
# State in /tmp/waybar-center-mode. Truncation handled by the module's max-length.

mode_file="/tmp/waybar-center-mode"
mode="$(cat "$mode_file" 2>/dev/null || echo auto)"

window_title() {
    hyprctl activewindow -j 2>/dev/null | jq -r '.title // ""'
}

now_playing() {
    local status player icon info
    status="$(playerctl -i kdeconnect status 2>/dev/null)"
    [ "$status" = "Playing" ] || return 1
    player="$(playerctl -i kdeconnect metadata --format '{{lc(playerName)}}' 2>/dev/null)"
    case "$player" in
        spotify) icon=$'\uf1bc' ;;
        mpv)     icon="🎵" ;;
        *)       icon="▶" ;;
    esac
    info="$(playerctl -i kdeconnect metadata --format '{{title}} - {{artist}}' 2>/dev/null)"
    [ -n "$info" ] || return 1
    printf '%s %s' "$icon" "$info"
}

if [ "$mode" = "window" ]; then
    window_title
else
    now_playing || window_title
fi
