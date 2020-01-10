# add ls to cd
function chpwd() {ls}

# cat copy
cop () { cat "$1" | xsel -ib }

# fkill - kill process
killf() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

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

# helm
khelm () {

    helm template . | kubectl apply -f -

}

khelm_delete () {

    helm template . | kubectl delete -f -

}

khelm_all () {

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
