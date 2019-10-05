#!/bin/sh
# Profile file. Runs on login.

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.local/share"

export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(find $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export PATH="$HOME/.local/bin/:$HOME/.config/fzf/bin:$XDG_CONFIG_HOME/npm/bin:/usr/lib/ruby/gems/2.6.0:$XDG_DATA_HOME/gem/ruby/2.6.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/usr/bin/vendor_perl:$HOME/.local/bin:/opt/google-cloud-sdk/bin:$XDG_DATA_HOME/go/bin:$PATH:$HOME/.local/share/cargo/bin"

# default programs
export BROWSER="qutebrowser"
export BROWSER2="chromium"
export EDITOR="nvim"
export FILEMANAGER="lf"
export FILEMANAGER2="nautilus"
export READER="zathura"
export RTV_BROWSER="w3m"
export TERMINAL="urxvtc"
export TERMINAL2="st"

# dotfiles
export GOPATH="$XDG_CONFIG_HOME/go"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/.jupyter/"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export NLTK_DATA="$XDG_DATA_HOME/lib/nltk_data"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export UNISON="$XDG_CONFIG_HOME"/unison
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XCOMPOSECACHE="$XDG_CACHE_HOME"/X11/xcompose
export XCOMPOSEFILE="$XDG_CONFIG_HOME"/X11/xcompose
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export QUTE_DATA_DIR="$XDG_DATA_HOME"/qutebrowser
export QUTE_CONFIG_DIR="$XDG_CONFIG_HOME"/qutebrowser

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
