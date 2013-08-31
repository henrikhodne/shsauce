[ -e "$HOME/.shrc" ] && source "$HOME/.shrc"

ZSH="$HOME/.spaghetti"
ZSH_THEME=agnoster

COMPLETION_WAITING_DOTS=true
setopt HIST_IGNORE_SPACE

plugins=(gnu-utils)

commandplugin() {
  cmd="$1"
  shift
  plugin=($@)
  [ $#plugin -eq 0 ] && plugin=("$cmd")
  command -v "$cmd" > /dev/null && plugins+=$plugin
}

commandplugin pacman archlinux
for cur in command-not-found systemd screen redis-cli git node npm go pass component; do
  commandplugin $cur
done
unset cur

[ -f /lib/security/pam_ssh.so ] || commandplugin ssh-agent

alias sudo='nocorrect sudo'

source $ZSH/zsh.sh

source "$HOME/.shalias"
