# vim: filetype=sh
umask 022
export EDITOR=vim
set -o vi

[ "$TERM" = "xterm" ] && export TERM="xterm-256color"
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

if test -d $HOME/.profile.d && ls "$HOME/.profile.d" | egrep -q '.'; then
    for profile in $HOME/.profile.d/*; do
        test -r "$profile" && source "$profile"
    done
    unset profile
fi
