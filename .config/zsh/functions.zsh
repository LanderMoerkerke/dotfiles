if [[ -n "$SSH_CONNECTION" ]] ; then
    banner_info
    alias v='vim'
    export EDITOR="vim"
    export TERM="xterm"
fi

# add ls to cd
function chpwd() {ls -hN --color=auto --group-directories-first}

# cat copy
function cop () { cat "$1" | xsel -ib }

# fkill - kill process
function killf() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# checkout branch
function gcbf() {
    local tags branches target
    tags=$(git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
    branches=$(git branch --all | grep -v HEAD |
    sed "s/.* //" | sed "s#remotes/[^/]*/##" |
    sort -u | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
    target=$( (echo "$branches"; echo "$tags") | fzf --no-hscroll --no-multi --delimiter="\t" -n 2 --ansi --preview="git log -200 --pretty=format:%s $(echo {+2..} |  sed 's/$/../' )" ) || return
    git checkout $(echo "$target" | awk '{print $2}')
}

# checkout commit
function gccf() {
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

function cd_git_root {
  dir='.'
  while [ ! -d "$dir/.git" ]; do
    [ $(readlink -m $dir) = '/' ] && return
    dir="../$dir"
  done

  cd $dir
}

# helm
function khelm () {

    helm template . | kubectl apply -f -

}

function khelm_delete () {

    helm template . | kubectl delete -f -

}

function khelm_all () {

    for i in $(ls); do

        if [ -d "$i" ]; then

            if [ "$i" != "shared" ]; then

                helm template "$i" | kubectl apply -f -

            fi

        fi

    done

}

# docker

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

# pacman
function pacman-qi(){
    pacman -Qeq \
        | fzf \
            --preview='pacman -Qi {}'\
            --height '80%'\
            --height='100%'\
            --bind='enter:execute(pacman -Qi {} | less)'
}


function docs-api () {
    http --auth-type=jwt --auth=$(gopass WeGroup/Docs-token) $*
}

function drone-api () {
    http --auth-type=jwt --auth="$DRONE_TOKEN" $*
}

function decode-vin-api () {
    api_key=$(gopass WeGroup/Vincario-api-key)
    api_key_secret=$(gopass WeGroup/Vincario-api-secret-key)
    checksum=$(echo -n "$1|decode|$api_key|$api_key_secret" | sha1sum | cut -c1-10)
    http "https://api.vindecoder.eu/3.2/$api_key/$checksum/decode/$1.json"
}

function clickup-api () {
    http --auth="$(gopass WeGroup/Clickup-API)" $*
}

function wgttp () {
    http --auth-type=jwt --auth=$(wg token --env qa | sed 1q) $*
}

alias wgttp-qa="wgttp"

function wgttp-staging () {
    http --auth-type=jwt --auth=$(wg token --env staging | sed 1q) $*
}

function wgttp-prod () {
    http --auth-type=jwt --auth=$(wg token --env production | sed 1q) $*
}

function py-format () {
    echo "Autoflake"
    autoflake \
        --recursive \
        --in-place \
        --expand-star-imports \
        --remove-all-unused-imports \
        --remove-unused-variables \
        --remove-duplicate-keys \
        $1

    echo "Black"
    black \
        -S \
        -l 120 \
        $1

    echo "Flake"
    flake8 \
        $1

}
