#!/bin/sh

pass_eval=`gpg2 --homedir $HOME/.local/share/gnupg -d $HOME/.password-store/Development/Spotify-spotifyd.gpg`

user_id=`echo "$pass_eval" | tail -n 1 | cut -d ':' -f 2`
secret_id=`echo "$pass_eval" | sed 1q`

album_location="/tmp/spotifyd_album.jpg"
notification_id=123

auz_token=`
    curl -s -X 'POST' -u $user_id:$secret_id -d grant_type=client_credentials https://accounts.spotify.com/api/token \
        | jq '.access_token' \
        | cut -d\" -f2
`

if [ "$auz_token" = "" ]; then
    echo "Cannot get token."
    exit 1
fi

call_spotify_api() {

    resp=`curl -s -X 'GET' https://api.spotify.com/v1/tracks/$TRACK_ID \
        -H 'Accept: application/json' \
        -H 'Content-Type: application/json'\
        -H 'Authorization: Bearer '$auz_token
    `

    artist=`echo "$resp" | jq '.artists[0].name' | cut -d\" -f2`
    track=`echo "$resp" | jq '.name' | cut -d\" -f2`
    album_name=`echo "$resp" | jq '.album.name' | cut -d\" -f2`

    album_url=`echo "$resp" | jq '.album.images[-1].url' | cut -d\" -f2`

    curl "$album_url" > "$album_location"

}

case "$PLAYER_EVENT" in
    "play" | "change")
        call_spotify_api
        dunstify -r $notification_id -i "$album_location" "$artist" "$track - $album_name"
        ;;
    # "change")
    #     call_spotify_api
    #     dunstify -r $notification_id -i "$album_location" "$artist" "$track - $album_name"
    #     ;;
    "pause")
        call_spotify_api
        dunstify -r $notification_id -i "$album_location" "$artist // paused" "$track - $album_name"
        ;;
esac
