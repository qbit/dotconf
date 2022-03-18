GOT_AUTHOR="Aaron Bieber <aaron@bolddaemon.com>"
BROWSER=$(which xdg-open 2>/dev/null)
OHMYKSH_DIR=${HOME}/src/ohmyksh
OHMYPATCHES=~/patches

PKG_PATH="$(cat /etc/installurl)/snapshots/packages/%a"

export GOT_AUTHOR BROWSER OHMYKSH_DIR OHMYPATCHES PKG_PATH

. ${OHMYKSH_DIR}/ohmy.ksh

set -A my_paths -- \
	/usr/ports/infrastructure/bin \
	~/bin \
	~/go/bin \
	~/.cargo/bin \
	/usr/local/plan9/bin

paths "${my_paths[@]}"

load_extension fonts
load_extension fzf
load_extension k
load_extension nocolor
load_extension openbsd
which keychain 2>&1 > /dev/null && load_extension keychain
load_extension pkgup

load_completion ssh
pgrep -q vmd && load_completion vmd
load_completion rc
#[ -d ~/.password-store ] && load_completion gopass
load_completion git
load_completion got
pgrep -q mpd && load_completion mpc
load_completion ogvt
load_completion man

#[[ -s ~/.ssh/host_config ]] && read_ssh_config ~/.ssh/host_config
#set -A complete_ssh -- ${HOST_LIST[*]}

alias dotconf='/usr/local/bin/git --git-dir=$HOME/.dotconf --work-tree=$HOME'
alias mutt='stty discard undef; neomutt'
alias tmux="tmux -u2"
alias vi=nvim
#alias got='env EDITOR=nvim got'
alias lookman='man -k'
alias gomuks='env GOMUKS_CACHE_HOME=~/.gomuks gomuks'
alias jfd='doas /usr/sbin/sysupgrade'
alias goupdate='make MODGO_VERSION=latest modgo-gen-modules'
alias scp='scp -s'
alias ocvs='cvs -dabieber@cvs.openbsd.org:/cvs'

# the q prompt auto-loads the git-prompt extension
set_prompt q

if [ -x ~/.ksh_local ]; then
	. ~/.ksh_local
fi

if [ -x ~/.po ]; then
	. ~/.po
fi
