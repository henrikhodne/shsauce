[ -e "$HOME/.shrc" ] && source "$HOME/.shrc"

COMPLETION_WAITING_DOTS=true
setopt HIST_IGNORE_SPACE

alias sudo='nocorrect sudo'

source "$HOME/.shalias"

autoload -U compinit
compinit

# Expand functions in the prompt
setopt prompt_subst

# Prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

