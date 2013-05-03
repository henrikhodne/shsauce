# vim: filetype=sh
umask 022
ulimit -n unlimited 2> /dev/null

export EDITOR=vim
set -o vi

[ "$TERM" = "xterm" ] || [ "$TERM" = "screen" ] && export TERM="$TERM-256color"
TERM=$(echo $TERM|cut -d- -f 1-2)

#bin folders
PATH="$HOME/.binlocal:$HOME/.bin:$PATH"
#npm
PATH="$HOME/npm/bin:$PATH"
#cabal
PATH="$HOME/.cabal/bin:$PATH"
#android dev kit
PATH="$HOME/android-sdk-linux/platform-tools:$HOME/android-sdk-linux/tools:$PATH"
#ARM dev stuff
PATH="$HOME/sat/bin:$PATH"
#go stuff
GOPATH="$HOME/go"
PATH="$HOME/go/bin:$PATH"
#ruby gems
command -v ruby > /dev/null 2> /dev/null && PATH="$(ruby -rubygems -e "puts Gem.user_dir")/bin:$PATH"

#nave
PATH="$NAVEPATH:$PATH"

if test -d $HOME/.profile.d && ls "$HOME/.profile.d" | egrep -q '.'; then
    for profile in $HOME/.profile.d/*; do
        test -r "$profile" && source "$profile"
    done
    unset profile
fi

if test -d $HOME/.configs; then
    for profile in $HOME/.configs/*/profile.sh; do
        test -r "$profile" && source "$profile"
    done
    unset profile
fi
