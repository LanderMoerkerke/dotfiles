#!/bin/sh

TMP_FILE="/tmp/.cover-url.txt"

IMG_FILE="/tmp/cover.png"
IMG_FILE_ROUNDED="/tmp/cover-rounded.png"
NON_IMAGE="/tmp/.cover-empty.png"

ALBUM_ART=$(playerctl -p spotify metadata mpris:artUrl 2>/dev/null)

if [ -z "$ALBUM_ART" ]; then
    magick -size 1x1 xc:none "$NON_IMAGE"
    echo $NON_IMAGE && exit
fi

if [ ! -e "$TMP_FILE" ]; then
    echo "$ALBUM_ART" >"$TMP_FILE"
elif grep -q "$ALBUM_ART" "$TMP_FILE"; then
    echo "$IMG_FILE_ROUNDED" && exit
fi

echo "$ALBUM_ART" >"$TMP_FILE"

curl -s "$ALBUM_ART" --output "$IMG_FILE" || exit

magick "$IMG_FILE" \
    \( +clone -alpha extract \
    -draw 'fill black polygon 0,0 0,200 200,0 fill white circle 200,200 200,0' \
    \( +clone -flip \) -compose Multiply -composite \
    \( +clone -flop \) -compose Multiply -composite \
    \) -alpha off -compose CopyOpacity -composite -unsharp 10x4+1+0 "$IMG_FILE_ROUNDED"

echo "$IMG_FILE_ROUNDED"
