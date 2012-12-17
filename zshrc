[ -e "$HOME/.shrc" ] && source "$HOME/.shrc"

# Path to your oh-my-zsh configuration.
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=agnoster

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS=true

plugins=(gnu-utils)

commandplugin() {
    cmd="$1"
    shift
    plugin=($@)
    [ $#plugin -eq 0 ] && plugin=("$cmd")
    command -v "$cmd" > /dev/null && plugins+=$plugin
}

commandplugin pacman archlinux
for cur in command-not-found ssh-agent systemd screen redis-cli git node npm; do
    commandplugin $cur
done
unset cur

source $ZSH/oh-my-zsh.sh
