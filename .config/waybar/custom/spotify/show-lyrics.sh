#!/bin/bash
# Prints the current Spotify lyric line (only while playing).
# The lyric is produced by spotify-lyrics.service (retrieve-lyrics.py -> sptlrx),
# which writes the current line to the regular file /tmp/lyrics-current. This
# script only READS that file — no sptlrx spawn, no FIFO, no blocking tail.

[ "$(playerctl -p spotify status 2>/dev/null)" = "Playing" ] || exit 0

# On track change, pre-resolve the Genius URL in the background so the on-click
# (open-lyric-genius.sh) is instant instead of doing a live search.
tid="$(playerctl -p spotify metadata mpris:trackid 2>/dev/null || true)"
if [ -n "$tid" ] && [ "$tid" != "$(cat /tmp/lyrics-trackid 2>/dev/null)" ]; then
    printf '%s' "$tid" >/tmp/lyrics-trackid
    "$HOME/.config/waybar/custom/spotify/open-lyric-genius.sh" --prewarm >/dev/null 2>&1 &
    disown 2>/dev/null || true
fi

cat /tmp/lyrics-current 2>/dev/null
