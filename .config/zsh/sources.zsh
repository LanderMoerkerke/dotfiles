# fw
if [[ -x "$(command -v fw)" ]]; then
  if [[ -x "$(command -v fzf)" ]]; then
    eval $(fw print-zsh-setup -f 2>/dev/null);
  else
    eval $(fw print-zsh-setup 2>/dev/null);
  fi;
fi;

# Gcloud
[ -f /opt/google-cloud-sdk/completion.zsh.inc ] && source /opt/google-cloud-sdk/completion.zsh.inc
fpath=($HOME/.zsh/completion $fpath)

# AWS
# source /usr/bin/aws_zsh_completer.sh

# FZF
source "$XDG_DATA_HOME/fzf/shell/key-bindings.zsh"
source "$XDG_DATA_HOME/fzf/shell/completion.zsh"

