# zmodload zsh/zprof

# Created by newuser for 5.5.1
TERM=xterm-256color
# -----------------------------------------------------------------------------------------------------------------------------
# TTY
# -----------------------------------------------------------------------------------------------------------------------------

banner_info () {

    DISTRO=$(cat /etc/*release* | grep -oP 'NAME="\K[^"]+' | head -n1)
    KERNEL=$(uname -r)
    PACKAGES_COUNT=$(test -f /bin/pacman && /usr/bin/pacman -Qq | wc -l || dpkg-query -l | wc -l)
    PACKAGES_TO_UPDATE=$(test -f /bin/checkupdates && checkupdates | wc -l || echo $(( $(apt list --upgradable 2> /dev/null | wc -l) - 1 )))
    HOSTNAME=$(hostname)
    UPTIME=$(uptime -p)
    CPU=$(awk 'BEGIN{FS=":"} /model name/ { print $2; exit }' /proc/cpuinfo | awk 'BEGIN{FS=" @"; OFS="\n"} { print $1; exit }')
    USERS=$(who)
    MEM=$(free -h | grep -v Swap)

    printf "\x1b[36;1m" # blue
    echo "#############################################################################################"
    echo ""
    printf "\x1b[32;1m" # green
    echo "\t\t\tWelcome to $HOSTNAME"
    printf "\x1b[36;1m" # blue
    echo ""
    echo "Distro: $DISTRO && Kernel: $KERNEL"
    echo ""
    echo "Cpu: $CPU"
    echo "$MEM"
    echo ""
    echo "Packages to update: $PACKAGES_TO_UPDATE\tPackages installed: $PACKAGES_COUNT"
    echo ""
    echo "Uptime: $UPTIME"
    echo ""
    echo "Users:"
    echo "$USERS"
    echo ""
    echo "#############################################################################################"
    printf "\x1b[38;0m" # normal

}

# -----------------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT_VARIABLES
# -----------------------------------------------------------------------------------------------------------------------------

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LFS="/mnt/lfs"
export ZSH=~/.oh-my-zsh
export RTV_BROWSER=w3m
export TMOUT=9600
export PAGER=less
export fpath=($HOME/.zsh-completions $fpath)
export GOPATH=~/.go
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

export JUPYTER_CONFIG_DIR="$HOME/.jupyter/"
export NLTK_DATA="$HOME/.local/lib/nltk_data"

# PIPENV
export PIPENV_DEFAULT_PYTHON_VERSION=3.7
export PIPENV_MAX_DEPTH=2
export PIPENV_SKIP_LOCK=1
export PIPENV_SPINNER=pong

# SCHOOL
export HOW=~/Documents/Howest/3NMCT/S5/
export CRT=~/Documents/Howest/3NMCT/S5/Create_V/
export DL=~/Documents/Howest/3NMCT/S5/Deep_Learning/
export IOT=~/Documents/Howest/3NMCT/S5/IoT/
export SU=~/Documents/Howest/3NMCT/S5/Start-Up/
export PRO=~/Documents/Howest/3NMCT/S5/Project_IV/

# VEST
export VEST=~/Documents/VEST/

# DOTFILES
export ZSHRC=~/.zshrc
export NVIM=~/.config/nvim/init.vim
export I3=~/.config/i3/config

# -----------------------------------------------------------------------------------------------------------------------------
# GENERAL
# -----------------------------------------------------------------------------------------------------------------------------

ENABLE_CORRECTION="true"
setopt AUTO_CD
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB

# -----------------------------------------------------------------------------------------------------------------------------
# OHMYZSH
# -----------------------------------------------------------------------------------------------------------------------------

ZSH_THEME="powerzeesh"
plugins=(
git
notify
vi-mode
zsh-autosuggestions
zsh-completions
zsh-dircolors-solarized
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# notify
zstyle ':notify:*' command-complete-timeout 10

zstyle ':notify:*' error-title "Command failed (in #{time_elapsed} seconds)"
zstyle ':notify:*' success-title "Command finished (in #{time_elapsed} seconds)"

zstyle ':notify:*' error-icon "$HOME/Pictures/Notifications/error.png"
zstyle ':notify:*' success-icon "$HOME/Pictures/Notifications/success.png"

# Colors
# LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:'

# -----------------------------------------------------------------------------------------------------------------------------
# BINDKEY
# -----------------------------------------------------------------------------------------------------------------------------

bindkey 'µ' autosuggest-accept
bindkey '^[[Z' reverse-menu-complete

# -----------------------------------------------------------------------------------------------------------------------------
# ALIASES
# -----------------------------------------------------------------------------------------------------------------------------

if [[ -n "$SSH_CONNECTION" ]] ; then

    alias v='vim'
    banner_info
    export EDITOR="vim"
    export TERM="xterm"


elif [[ $TTY == "/dev/tty1" ]]; then

    exec startx

else

    alias vim='nvim'
    alias v='nvim'

fi

# add ls to cd
function chpwd() {
    ls
}

alias cdh="cd $HOME"
alias up="cd .."
alias chmod_num="stat --format '%a'"
alias password16="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1"
alias password32="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1"
alias password64="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1"
alias rt='rtorrent'
alias gpom="git push origin master"
alias gits="git status"
alias gc="git checkout"
alias gp="git pull"
alias gda="git diff -a"
alias docka="docker run --rm -it alpine sh"
alias temp='cat /sys/bus/acpi/drivers/thermal/LNXTHERM\:00/thermal_zone/temp'
alias dus='du -sh *'
alias tree='tree -Csuh'
alias more='less'
alias L='less'
alias lg='lazygit'
alias browse='w3m -F -graph -o auto_image=TRUE'
alias music='echo "press enter to play" && mocp -n -T alldefault'
alias rtv='rtv --enable-media'
alias SS='sudo systemctl'
alias df='df -kTh'
alias df='dfc -T'
alias ll='ls -latrFi'
alias ls='ls -hN --color=auto --group-directories-first'
alias we='curl wttr.in/Gent'
alias pdf='zathura'
alias soundcloud="scdl"
alias mp3="youtube-dl --extract-audio --audio-format mp3"
alias python3="python3.6"
alias pip="pip3.7"
alias pip3="pip3.6"
alias pe="pipenv"
alias peinit="pipenv install pynvim 'python-language-server[all]' --dev"
alias jn="jupyter notebook --browser=Chromium"

## one letter aliasses

alias e='emacs -nw'
alias i='feh --geometry 400x400'
alias j="joplin"
alias l='ls -latrFi'
alias m='neomutt'
alias n='/usr/bin/newsboat'
alias o='cd /run/media/$USER/'
alias p="python"
alias p3="python3"
alias r='ranger'
alias s="slack-term"
alias t="tree"
alias u="unzip"

## xrandr

alias xrandr_right="xrandr --output DP-2 --auto --right-of eDP-1"
alias xrandr_left="xrandr --output DP-2 --auto --left-of eDP-1"

## nmap

alias nmap_open_ports="nmap --open"
alias nmap_list_interfaces="nmap --iflist"
alias nmap_slow="nmap -sS -v -T1"
alias nmap_fin="nmap -sF -v"
alias nmap_full="nmap -sS -T4 -PE -PP -PS80,443 -PY -g 53 -A -p1-65535 -v"
alias nmap_check_for_firewall="nmap -sA -p1-65535 -v -T4"
alias nmap_ping_through_firewall="nmap -PS -PA"
alias nmap_fast="nmap -F -T5 --version-light --top-ports 300"
alias nmap_detect_versions="nmap -sV -p1-65535 -O --osscan-guess -T4 -Pn"
alias nmap_check_for_vulns="nmap --script=vulscan"
alias nmap_full_udp="nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,443,3389 "
alias nmap_traceroute="nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute "
alias nmap_full_with_scripts="sudo nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all "
alias nmap_web_safe_osscan="sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy "

## system maintenance

alias pacman_listpackages="expac "%n %m" -l'\n' -Q $(pacman -Qq) | sort -rhk 2 | less"
alias pacman_listpackages_size="paste <(pacman -Q | awk '{ print $1; }' | xargs pacman -Qi | grep 'Size' | awk '{ print $4$5; }') <(pacman -Q | awk '{print $1; }') | sort -n | column -t | less"

alias mailsync="bash $HOME/.config/mutt/etc/mailsync.sh"

alias selection_to_image="xclip -selection clipboard -t image/jpg -o > $1"
alias image_to_selection="xclip -selection clipboard -t image/jpg -i $1"

# -----------------------------------------------------------------------------------------------------------------------------
# SERVICES
# -----------------------------------------------------------------------------------------------------------------------------

alias vmware_start="sudo systemctl start vmware-hostd-certificates.service vmware-networks-configuration.service vmware-usbarbitrator.service vmware-hostd.service vmware-networks.service"
alias vmware_stop="sudo systemctl stop vmware-hostd-certificates.service vmware-networks-configuration.service vmware-usbarbitrator.service vmware-hostd.service vmware-networks.service"

# -----------------------------------------------------------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------------------------------------------------------

wificonnect () {

    # TODO: append

    if [ "$1" = "" ]; then

        echo "specify /etc/wpa_supplicant/<FILE>"
        return

    fi

    if [ "$(ps aux | grep dhcpcd | wc -l)" -eq 1 ]; then

        sudo dhcpcd

    fi

    if [ "$(ps aux | grep wpa_supplicant | wc -l)" -gt 1 ]; then

        echo "already connected"
        sudo killall wpa_supplicant
        sleep 3
        sudo wpa_supplicant -B -i wlp2s0 -c "$1"

    else

        sudo wpa_supplicant -B -i wlp4s0 -c "$1"

    fi

}

gitquick () {

    if [[ $1 = "" ]]; then

        string="git quick push"

    else

        string=$1

    fi

    git add .
    git commit -m "$string"
    git push origin

}

wifiscan () {

    sudo iw dev wlp2s0 scan
    printf "\x1b[36;1m  SSID\n\n"
    sudo iw dev wlp2s0 scan | grep SSID

}

pull () {

    for i in *; do

        printf "\x1b[36;1m\n"
        echo "-> checking $i"

        if test -n "$(git -C $i status --porcelain --ignore-submodules)"; then

            printf "\x1b[31;1m"
            echo "=====>> \tdirty repo: $i"

        fi

        printf "\x1b[38;0m\n"
        git -C $i pull

    done

}

# -----------------------------------------------------------------------------------------------------------------------------
# SERVERS
# -----------------------------------------------------------------------------------------------------------------------------

ssh_rpi () {
    ssh lander@landerpi.home
}

mtpfs_op () {
    sudo simple-mtpfs --device 1 /mnt/android -v -o allow_other
}

# -----------------------------------------------------------------------------------------------------------------------------
# FZF
# -----------------------------------------------------------------------------------------------------------------------------

[ -f ~/.fzf/.fzf.zsh ] && source ~/.fzf/.fzf.zsh

export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file .gitignore_global ."
export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --border'

# Vim
xf() { fzf | xargs -r -I % xdg-open % &;}

# Try highlight, coderay, rougify in turn, then fall back to cat
vf() { fzf --height 100% --preview '[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 (highlight -O ansi -l {} ||
                  coderay {} ||
                  rougify {} ||
                  cat {}) 2> /dev/null | head -500' | xargs -r -I % $EDITOR % ;}

# fkill - kill process
killf() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# ff() { fzf --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"; }

# checkout branch
gcbf() {
    local tags branches target
    tags=$(git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
    branches=$(git branch --all | grep -v HEAD |
    sed "s/.* //" | sed "s#remotes/[^/]*/##" |
    sort -u | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
    target=$( (echo "$branches"; echo "$tags") | fzf --no-hscroll --no-multi --delimiter="\t" -n 2 --ansi --preview="git log -200 --pretty=format:%s $(echo {+2..} |  sed 's/$/../' )" ) || return
    git checkout $(echo "$target" | awk '{print $2}')
}

# checkout commit
gccf() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf --tac +s +m -e) &&
    git checkout $(echo "$commit" | sed "s/ .*//");
}

# Interactive cd
function cd() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p --color=always "${__cd_path}";
        ')"
        [[ ${#dir} == 0 ]] && ls && return 0
        builtin cd "$dir" &> /dev/null
    done
}

# DOCKER
# Select a docker container to start and attach to
function daf() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Select a running docker container to stop
function dsf() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# -----------------------------------------------------------------------------------------------------------------------------
# GCLOUD
# -----------------------------------------------------------------------------------------------------------------------------

[ -f /opt/google-cloud-sdk/completion.zsh.inc ] && source /opt/google-cloud-sdk/completion.zsh.inc

# -----------------------------------------------------------------------------------------------------------------------------
# MISC
# -----------------------------------------------------------------------------------------------------------------------------
alias sudo='nocorrect sudo'

# dir colors cd
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# zprof

zle-keymap-select () {
  if [ $KEYMAP = vicmd ]; then
        echo -ne '\e[1 q'
    else
        echo -ne '\e[5 q'
  fi
}
zle-line-init () {
  zle -K viins
  echo -ne "\033]12;Grey\007"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
