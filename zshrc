[ -e "$HOME/.shrc" ] && source "$HOME/.shrc"

# Path to your oh-my-zsh configuration.
ZSH="$HOME/.oh-my-zsh"
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
for cur in command-not-found ssh-agent systemd screen redis-cli git node npm go pass; do
    commandplugin $cur
done
unset cur

alias sudo='nocorrect sudo'

source $ZSH/oh-my-zsh.sh

source "$HOME/.shalias"
