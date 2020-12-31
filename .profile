#!/bin/sh

# Settings
export TMOUT=9600

# XDG Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# PATH

# user
export PATH="\
$HOME/.local/bin:\
$XDG_DATA_HOME/fzf/bin:\
$XDG_DATA_HOME/npm/bin:\
$XDG_DATA_HOME/gem/bin:\
$XDG_DATA_HOME/go/bin:\
$XDG_DATA_HOME/cargo/bin\
$PATH
"

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du -L "$HOME/.local/bin" | cut -f2 | paste -sd ':' -)"

# system
export PATH="
/usr/local/sbin:\
/usr/local/bin:\
/usr/sbin:\
/usr/bin:\
/sbin:\
/usr/bin/vendor_perl\
/opt/google-cloud-sdk/bin:\
$PATH
"

export LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH=/usr/local/lib

# default programs
export BROWSER="qutebrowser"
export BROWSER2="brave"
export EDITOR="nvim"
export FILEMANAGER="lf"
export FILEMANAGER2="nautilus"
export READER="zathura"
export RTV_BROWSER="w3m"
export TERMINAL="urxvt"
export TERMINAL2="alacritty"

# dotfiles
export GOPATH="$XDG_DATA_HOME/go"
export GOROOT="/usr/lib/go"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export NLTK_DATA="$XDG_DATA_HOME/nltk/data"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export NPM_CONFIG_USERCONFIG="$XDG_DATA_HOME/npm/npmrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
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
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export HISTFILE="$XDG_DATA_HOME"/bash/history
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export KREW_ROOT="$XDG_CONFIG_HOME"/krew
export TLDEXTRACT_CACHE="$XDG_CACHE_HOME"/tld_extract
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

export CUDA_HOME=/opt/cuda

# VEST
export VEST=$HOME/Documents/VEST/

# WORK
export WG=$HOME/Documents/Work/WeGroup
export BITBUCKET=$WG/Bitbucket

# Biber
export COMPILE="$HOME/Documents/LaTeX"
export BIB="$COMPILE/uni.bib"

# Printer
export SANE_CONFIG_DIR=hpaio:/net/Officejet_6700?ip=192.168.0.20

# Appearance
export QT_QPA_PLATFORMTHEME="qt5ct"

# Less
export PAGER=less
export LESS=-R
export LESSOPEN="|file-preview %s"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so=$(printf '\33[5;30;43m')
export LESS_TERMCAP_se=$(printf '\33[m')
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

# Pipenv
export PIPENV_DEFAULT_PYTHON_VERSION=3
export PIPENV_MAX_DEPTH=5
export PIPENV_SKIP_LOCK=1
export PIPENV_SPINNER=pong
export PIPENV_DOTENV_LOCATION="$HOME/Documents/Pipenv/.env"

# FZF
export FZF_DEFAULT_COMMAND="rg --files -L --hidden --ignore-file $HOME/.gitignore_global --ignore-file .gitignore ."

# export FZF_DEFAULT_OPTS="-m --height 40% --layout=reverse --border --bind ctrl-k:preview-up,ctrl-j:preview-down,ctrl-d:preview-page-down,ctrl-u:preview-page-up --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export FZF_DEFAULT_OPTS="-m --height 40% --layout=reverse --border --bind ctrl-k:preview-up,ctrl-j:preview-down,ctrl-d:preview-page-down,ctrl-u:preview-page-up --preview 'file-preview {}'"


. "$XDG_DATA_HOME"/icons/term-icons
. $HOME/.profile_appendix
