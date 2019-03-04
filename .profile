#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export PATH="$HOME/.local/bin/:$HOME/.npm-global/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.go/bin:/usr/bin/vendor_perl:$HOME/.local/bin:/opt/google-cloud-sdk/bin:$PATH"

# default programs
export BROWSER="qutebrowser"
export BROWSER2="chromium"
export EDITOR="nvim"
export FILEMANAGER="ranger"
export READER="zathura"
export RTV_BROWSER="w3m"
export TERMINAL="urxvt"
export TERMINAL2="st"

export COMPILE="$HOME/Documents/LaTeX"
export BIB="$COMPILE/uni.bib"

export SANE_CONFIG_DIR=hpaio:/net/Officejet_6700?ip=192.168.0.20

source $HOME/.profile_appendix
