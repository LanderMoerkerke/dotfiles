#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export PATH=~"/.npm-global/bin:~/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.vimpkg/bin:~/.vimpkg/bin:~/.config/composer/vendor/bin:~/.go/bin:~/.cargo/bin:~/.gem/ruby/2.5.0/bin:/usr/bin/vendor_perl:~/.local/bin:/opt/google-cloud-sdk/bin:$PATH"

# default programs
export BROWSER="qutebrowser"
export EDITOR="nvim"
export FILEMANAGER="ranger"
export READER="zathura"
export RTV_BROWSER="w3m"
export TERMINAL="urxvt"

export SANE_CONFIG_DIR=hpaio:/net/Officejet_6700?ip=192.168.0.50
