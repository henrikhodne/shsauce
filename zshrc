[ -e "$HOME/.shrc" ] && source "$HOME/.shrc"

COMPLETION_WAITING_DOTS=true
setopt HIST_IGNORE_SPACE

alias sudo='nocorrect sudo'

source "$HOME/.shalias"
