OHMYKSH_DIR=/home/qbit/src/ohmyksh
. ${OHMYKSH_DIR}/ohmy.ksh

set -A my_paths -- \
	/usr/ports/infrastructure/bin \
	~/bin \
	~/go/bin \
	/usr/local/plan9/bin

paths "${my_paths[@]}"

load_extension fonts
load_extension k
load_extension nocolor
load_extension openbsd

load_completion ssh
load_completion vmd
load_completion rc
#load_completion gopass
load_completion git

alias vi=vim
alias dotconf='/usr/local/bin/git --git-dir=$HOME/.dotconf --work-tree=$HOME'

# the q prompt auto-loads the git-prompt extension
set_prompt q
