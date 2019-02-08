FG=black
SYMBOLS=()

# colors picked from 256 colors
color_prompt_name_fg=2
color_prompt_name_bg=0
color_prompt_root_fg=1
color_prompt_root_bg=0

color_prompt_dir_fg=6
color_prompt_dir_bg=7
color_prompt_dir_root_bg=8
color_prompt_dir_root_fg=11

color_prompt_white=7
color_prompt_git_green=2
color_prompt_git_orange=11
color_prompt_git_red=1

# segments
prompt_segment () {

    local bg fg

    [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
    [[ -n $2 ]] && fg="%F{$2}" || fg="%f"

    if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then

        print -n "%{$fg%}"

    else

        print -n "%{$fg%}"

    fi

    CURRENT_BG=$1
    [[ -n $3 ]] && print -n $3

}

prompt_context () {

    local user=`whoami`

    if [[ -n "$SSH_CONNECTION" ]]; then

        prompt_segment $color_prompt_name_bg $color_prompt_name_fg "%{%F{white}%}[SSH] %{%F{yellow}%}%{%F{$color_prompt_name_fg}%}${HOST}"

    elif [[ $(id -u) -ne 0 ]]; then

        prompt_segment $color_prompt_name_bg $color_prompt_name_fg "$"

    else

        if grep "Server" /etc/hostname > /dev/null || grep "wg" /etc/hostname > /dev/null; then

            prompt_segment $color_prompt_root_bg $color_prompt_root_fg "# %{%F{white}%}[SSH] %{%F{$color_prompt_root_fg}%}${HOST}"

        else

            prompt_segment $color_prompt_root_bg $color_prompt_root_fg "#"

        fi

    fi

}

prompt_git () {

    local color ref

    is_dirty () {

        test -n "$(git status --porcelain --ignore-submodules)"

    }

    commitsAhead () {

        test -n "$(git_commits_ahead)"

    }

    ref="$vcs_info_msg_0_"

    if [[ -n "$ref" ]]; then

        if is_dirty; then

            color=$color_prompt_git_red
            ref="${ref} $PLUSMINUS"

        elif commitsAhead; then

            color=$color_prompt_git_orange
            ref="${ref} $STAR"

        else

            color=$color_prompt_git_green
            ref="${ref} "

        fi

        if [[ "${ref/.../}" == "$ref" ]]; then

            ref="$BRANCH $ref"

        else

            ref="$DETACHED ${ref/.../}"

        fi

        prompt_segment $color $color " {$ref}"

    fi

}

prompt_vpn () {

    local OUTPUT=`pgrep -x openvpn`

    if [[ $OUTPUT != "" ]]; then

        prompt_segment $color_prompt_dir_bg $color_prompt_git_red ' <VPN>'

    fi

}

prompt_dir () {

    prompt_segment $color_prompt_dir_bg $color_prompt_dir_fg ' %~'

}

prompt_virtualenv () {

    if [[ -n $VIRTUAL_ENV ]]; then

        color=cyan
        prompt_segment $color_prompt_dir_bg $color_prompt_git_orange
        print -Pn " $(basename $VIRTUAL_ENV)"

    fi

}

prompt_end () {

    [[ $CURRENT_BG == 8 ]] && print -n "%{%F{white}%} ❯" || print -n "%{%F{white}%} ❯"

}

# status:
# - error
# - jobs
# - vagrant
# - nodejs
prompt_status () {

    [[ $RETVAL -ne 0 ]] && SYMBOLS+="%{%F{red}%}$RETVAL "
    [[ $(jobs -l | wc -l) -gt 0 ]] && SYMBOLS+="%{%F{cyan}%}J "

    if [[ -d ./.vagrant/machines  ]]; then

        if [[ -f .vagrant/machines/default/virtualbox/id && $(VBoxManage list runningvms | grep -c $(/bin/cat .vagrant/machines/*/*/id)) -gt 0  ]]; then

            SYMBOLS+="%{%F{green}%}V "
            else
            SYMBOLS+="%{%F{red}%}V "

        fi

    fi

    if [[ -d ./node_modules ]]; then

        SYMBOLS+="%{%F{green}%}`node -v 2> /dev/null` "

    fi

    prompt_segment $FG default "$SYMBOLS"

}

prompt () {

    CURRENT_BG="NONE"
    prompt_context
    prompt_virtualenv
    prompt_vpn
    prompt_dir
    prompt_git
    prompt_end

}

prompt_precmd () {

    RETVAL=$?
    vcs_info
    PROMPT='%{%f%b%k%}$(prompt) '
    RPROMPT='%{%f%b%k%}$(prompt_status) '

}

prompt_setup () {

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    prompt_opts=(cr subst percent)

    add-zsh-hook precmd prompt_precmd

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' check-for-changes false
    zstyle ':vcs_info:git*' formats '%b'
    zstyle ':vcs_info:git*' actionformats '%b (%a)'

}

prompt_setup "$@"

