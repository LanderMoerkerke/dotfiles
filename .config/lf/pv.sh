#!/bin/sh

case "$1" in
    *.tar*) atool --list -- "$1";;
    *.zip) atool --list -- "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    *.ipynb) jupyter nbconvert --stdout --to python "$1";;
    *.mp4) mediainfo "$1";;
    *) highlight -O xterm256 -D /home/lander/.config/highlight/ -s rdark --force -- "$1" || cat "$1";;
    # *) highlight -O ansi "$1" || cat "$1";;
esac
