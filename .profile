#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(find $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export PATH="$HOME/.local/bin/:$HOME/.config/fzf/bin:$HOME/.npm-global/bin:/usr/lib/ruby/gems/2.6.0:$HOME/.gem/ruby/2.6.0:$HOME/.gem/ruby/2.6.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.go/bin:/usr/bin/vendor_perl:$HOME/.local/bin:/opt/google-cloud-sdk/bin:$HOME/.go/bin:$PATH"

# default programs
export BROWSER="qutebrowser"
export BROWSER2="chromium"
export EDITOR="nvim"
export FILEMANAGER="lf"
export FILEMANAGER2="nautilus"
export READER="zathura"
export RTV_BROWSER="w3m"
export TERMINAL="urxvt"
export TERMINAL2="st"

export GOPATH="$HOME/.go"

# dotfiles
export ZDOTDIR="$HOME/.config/zsh"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"

# VEST
export VEST=$HOME/Documents/VEST/

# WORK
export WG=$HOME/Documents/Work/WeGroup
export BITBUCKET=$WG/Bitbucket

export COMPILE="$HOME/Documents/LaTeX"
export BIB="$COMPILE/uni.bib"

export SANE_CONFIG_DIR=hpaio:/net/Officejet_6700?ip=192.168.0.20

export QT_QPA_PLATFORMTHEME="qt5ct"

. $HOME/.icons/term-icons
. $HOME/.profile_appendix
