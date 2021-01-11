GOT_AUTHOR="Aaron Bieber <aaron@bolddaemon.com>"
BROWSER=$(which xdg-open 2>/dev/null)
OHMYKSH_DIR=${HOME}/src/ohmyksh

export GOT_AUTHOR BROWSER OHMYKSH_DIR

. ${OHMYKSH_DIR}/ohmy.ksh

set -A my_paths -- \
	/usr/ports/infrastructure/bin \
	~/bin \
	~/go/bin \
	/usr/local/plan9/bin

paths "${my_paths[@]}"

load_extension fonts
load_extension fzf
load_extension k
load_extension nocolor
load_extension openbsd
load_extension pkgup

load_completion ssh
pgrep -q vmd && load_completion vmd
load_completion rc
[ -d ~/.password-store ] && load_completion gopass
load_completion git
load_completion got
pgrep -q mpd && load_completion mpc

alias dotconf='/usr/local/bin/git --git-dir=$HOME/.dotconf --work-tree=$HOME'
alias mutt='stty discard undef; neomutt'
alias tmux="tmux -u2"
alias vi=vim
alias got='env EDITOR=vim got'

# the q prompt auto-loads the git-prompt extension
set_prompt q

[ -x ~/.po ] && . ~/.po
