#!/bin/bash

# Simple script that determines what my polybar music module prints
# If spotify is playing it prints each lyric, if not then it prints
# last sources title

STATUS=$(playerctl -p spotify status)

# Check if programs installed
if ! command -v "playerctl" &>/dev/null && ! command -v "sptlrx" &>/dev/null; then
    echo "Proper programs not installed!"
    exit
fi

# Check if pipe is running
if ! pgrep -f 'sptlrx pipe' >/dev/null; then
    sptlrx pipe >>/tmp/lyrics &
fi

# On track change, pre-resolve the Genius URL in the background so the
# on-click (open-lyric-genius.sh) is instant instead of doing a live search.
tid="$(playerctl -p spotify metadata mpris:trackid 2>/dev/null || true)"
if [ -n "$tid" ] && [ "$tid" != "$(cat /tmp/lyrics-trackid 2>/dev/null)" ]; then
    printf '%s' "$tid" >/tmp/lyrics-trackid
    "$HOME/.config/waybar/custom/spotify/open-lyric-genius.sh" --prewarm >/dev/null 2>&1 &
    disown 2>/dev/null || true
fi

# Script's logic
if [ "$STATUS" == "Playing" ]; then
    line="$(tail -1 /tmp/lyrics)"
    # Mirror the displayed line to a regular file so the on-click handler can
    # read it instantly (the /tmp/lyrics FIFO can't be tail-1'd without blocking).
    printf '%s' "$line" > /tmp/lyrics-current
    echo "$line"
else
    exit
fi
