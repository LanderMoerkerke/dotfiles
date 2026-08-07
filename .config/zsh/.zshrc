# Environment_variables
# ---------------------

export ZSH_DISABLE_COMPFIX=true
export COLORTERM=24bit

export ZSH=$HOME/.config/oh-my-zsh
export ZDOTDIR=$HOME/.config/zsh
export XDG_DATA_HOME=$HOME/.local/share

# Oh My Zsh
# ---------------------

ZSH_THEME="powerzeesh"

plugins=(
# notify
vi-mode
fzf-tab
zsh-autosuggestions
zsh-completions
zsh-syntax-highlighting
forgit
)

# Include hidden files in completion (must precede oh-my-zsh's compinit)
_comp_options+=(globdots)

source $ZSH/oh-my-zsh.sh

# notify
zstyle ':notify:*' command-complete-timeout 10

zstyle ':notify:*' error-title "Command failed (in #{time_elapsed})"
zstyle ':notify:*' success-title "Command finished (in #{time_elapsed})"

zstyle ':notify:*' error-icon "$HOME/Pictures/Notifications/error.png"
zstyle ':notify:*' success-icon "$HOME/Pictures/Notifications/success.png"

# fzf-tab
zstyle ':fzf-tab:*' continuous-trigger 'alt-enter'

# General
# ---------------------

ENABLE_CORRECTION="true"
setopt AUTO_CD
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB

ZSH_DISABLE_COMPFIX=true

# History in cache directory:
export HISTSIZE=10000000000
export SAVEHIST=10000000000
setopt EXTENDED_HISTORY
export HISTFILE=$HOME/.cache/zsh/history

zstyle ':completion:*' menu select
zmodload zsh/complist

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Bindkey
# ---------------------

source "$ZDOTDIR/vi.zsh"

bindkey 'µ' autosuggest-accept
bindkey '^[[Z' reverse-menu-complete

# Sources
# ---------------------

source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/sources.zsh"
