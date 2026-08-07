#!/usr/bin/env bash
# Open the current Spotify song's Genius page, scrolled to the currently
# displayed lyric line via a browser text-fragment (#:~:text=...).
# Triggered by the waybar custom/lyrics on-click.
#
# Creds: gopass Development/Genius-Waybar (fields: client_id, client_secret)
# Speed: the resolved song URL is cached per track (keyed by mpris:trackid),
# and show-lyrics.sh pre-warms that cache on track change, so a click is
# usually just "read cache + open browser". Token is cached too.
#
# Usage: open-lyric-genius.sh            open browser at current line
#        open-lyric-genius.sh --prewarm  resolve+cache URL only, no browser

set -euo pipefail

LYRICS_FILE="/tmp/lyrics-current"   # regular file mirrored by show-lyrics.sh (the FIFO /tmp/lyrics blocks tail -1)
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
TOKEN_CACHE="$CACHE_DIR/genius-token"
URL_CACHE="$CACHE_DIR/genius-url-cache"          # "<trackid>\t<url>"
GOPASS_ENTRY="Development/Genius-Waybar"
BROWSER_CMD="${BROWSER:-xdg-open}"

PREWARM=0
[ "${1:-}" = "--prewarm" ] && PREWARM=1

note() {
    [ "$PREWARM" = 1 ] && return 0
    if command -v notify-send >/dev/null 2>&1; then notify-send "Genius lyrics" "$1"; else echo "$1" >&2; fi
}

artist="$(playerctl -p spotify metadata artist       2>/dev/null || true)"
title="$( playerctl -p spotify metadata title        2>/dev/null || true)"
trackid="$(playerctl -p spotify metadata mpris:trackid 2>/dev/null || true)"
[ -n "$title" ] || { note "Nothing playing on Spotify."; exit 0; }

# --- resolve song URL: per-track cache first, then Genius API --------------
url=""
if [ -n "$trackid" ] && [ -r "$URL_CACHE" ]; then
    IFS=$'\t' read -r cached_track cached_url < "$URL_CACHE" || true
    [ "$cached_track" = "$trackid" ] && url="$cached_url"
fi

if [ -z "$url" ]; then
    fetch_token() {
        local creds cid csecret
        creds="$(gopass show "$GOPASS_ENTRY" 2>/dev/null)"          # one call, both fields
        cid="$(    printf '%s\n' "$creds" | sed -n 's/^client_id: *//p')"
        csecret="$(printf '%s\n' "$creds" | sed -n 's/^client_secret: *//p')"
        curl -s --max-time 8 'https://api.genius.com/oauth/token' \
            --data-urlencode "client_id=$cid" \
            --data-urlencode "client_secret=$csecret" \
            --data-urlencode 'grant_type=client_credentials' \
            | jq -r '.access_token // empty'
    }
    genius_search() {
        curl -s --max-time 8 \
            "https://api.genius.com/search?q=$(printf %s "$1" | jq -sRr @uri)" \
            -H "Authorization: Bearer $2"
    }

    token=""
    [ -r "$TOKEN_CACHE" ] && token="$(cat "$TOKEN_CACHE" 2>/dev/null || true)"
    if [ -z "$token" ]; then
        token="$(fetch_token)"
        [ -n "$token" ] || { note "Could not obtain Genius token."; exit 1; }
        umask 077; printf '%s' "$token" > "$TOKEN_CACHE"
    fi

    resp="$(genius_search "$artist $title" "$token")"
    if [ "$(printf '%s' "$resp" | jq -r '.meta.status // empty')" = "401" ]; then
        token="$(fetch_token)"; umask 077; printf '%s' "$token" > "$TOKEN_CACHE"
        resp="$(genius_search "$artist $title" "$token")"
    fi

    url="$(printf '%s' "$resp" | jq -r '.response.hits[0].result.url // empty')"
    [ -n "$url" ] && [ -n "$trackid" ] && { umask 077; printf '%s\t%s\n' "$trackid" "$url" > "$URL_CACHE"; }
fi

[ -n "$url" ] || { note "No Genius page found for $artist – $title."; exit 0; }
[ "$PREWARM" = 1 ] && exit 0                       # cache populated; done

# --- append a text-fragment so the browser jumps to the current line ------
# jq @uri leaves '-' literal; '-' is a text-fragment delimiter, so encode it.
line=""
# /tmp/lyrics may be a FIFO (systemd lyrics service) where tail -1 blocks with
# no EOF; cap it so a click is never stalled waiting for the next lyric line.
[ -r "$LYRICS_FILE" ] && line="$(timeout 0.3 tail -n1 "$LYRICS_FILE" 2>/dev/null || true)"
if [ -n "$line" ]; then
    enc="$(printf %s "$line" | jq -sRr @uri | sed 's/-/%2D/g')"
    url="${url}#:~:text=${enc}"
fi

exec "$BROWSER_CMD" "$url"
