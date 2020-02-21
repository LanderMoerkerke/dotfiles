# one letter aliasses

alias L='less'
alias R="R --quiet --no-save"
alias c="xclip -selection clipboard"
alias g="gcloud"
alias j="joplin"
alias l='ls -latrFi'
alias m='neomutt'
alias n="newsboat"
alias p2="python2"
alias p="python"
alias t="tree"

# git

alias gc="git checkout"
alias gda="git diff -a"
alias gits="git status"
alias gp="git pull"
alias gpom="git push origin master"

alias lg='lazygit'
alias tiga="tig --all"

# docker

alias dcu="docker-compose up"
alias dbuild="docker build --pull"

alias ld='lazydocker'

# python

alias jn="jupyter notebook --browser=Chromium"

alias ll='ls -latrFi'
alias ls='ls -hN --color=auto --group-directories-first'
alias more='less'
alias mp3="youtube-dl --extract-audio --audio-format mp3"

# system

alias SS='sudo systemctl'

alias password16="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1"
alias password32="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1"
alias password64="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1"

alias tree='tree -Csuh'

alias fo="fuzzy-open"

alias cdh="cd $HOME"
alias cdl="cd $(readlink '$1')"

alias df='dfc -T'
alias dus='du -sh *'

alias chmod_num="stat --format '%a'"

alias pacman_listpackages="expac "%n %m" -l'\n' -Q $(pacman -Qq) | sort -rhk 2 | less"
alias pacman_listpackages_size="paste <(pacman -Q | awk '{ print $1; }' | xargs pacman -Qi | grep 'Size' | awk '{ print $4$5; }') <(pacman -Q | awk '{print $1; }') | sort -n | column -t | less"

# alias sudo='nocorrect sudo'

# applications

alias rtv='rtv --enable-media'
alias soundcloud="scdl"
alias we='curl wttr.in/Gent'

# programming

alias update-pymodels='git --git-dir=$WG/Bitbucket/OTHER/wg-py-models/.git pull'
alias pc="pre-commit run --all-files"

alias pe="pipenv"
alias pes="pipenv shell"
alias peg="pipenv graph | less"
alias peinit="pipenv install 'pynvim' 'python-language-server[all]' 'pyls-mypy' 'pyls-isort' --dev"

alias py37-env="source $HOME/Pipenv/python37-venv/.venv/bin/activate"
alias py38-env="source $HOME/Pipenv/python38-venv/.venv/bin/activate"
alias py2-env="source $HOME/Pipenv/python2-venv/.venv/bin/activate"

alias py-clean="find . | grep -E '(\.tox$|__pycache__|\.pyc|\.pyo$)' | xargs rm -rf"

# nmap

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

# vmware
alias vmware_start="sudo systemctl start vmware-hostd-certificates.service vmware-networks-configuration.service vmware-usbarbitrator.service vmware-hostd.service vmware-networks.service"
alias vmware_stop="sudo systemctl stop vmware-hostd-certificates.service vmware-networks-configuration.service vmware-usbarbitrator.service vmware-hostd.service vmware-networks.service"
