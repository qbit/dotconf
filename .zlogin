#export PLAN9=~/src/plan9port
#export PATH=$PATH:$HOME/go/bin:$PLAN9/bin
export PATH=$PATH:$HOME/go/bin

# That sweet sweet ^W
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

autoload -Uz compinit && compinit
autoload -Uz vcs_info
autoload -Uz colors && colors
#[ -n "$BASH" ] && complete -F _fzf_complete_doge -o default -o bashdefault doge

export GPG_AGENT_INFO="~/.gnupg/S.gpg-agent:$(pgrep gpg-agent):1"
#/usr/local/bin/keychain --inherit any --agents ssh,gpg -q -Q
#[[ -f ~/.keychain/ufo.local-sh-gpg  ]] && . ~/.keychain/ufo.local-sh-gpg

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst

zstyle ':vcs_info:*' enable git hg cvs 
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '[%b]'

PROMPT="%n@%m[%(?.%{$fg[white]%}.%{$fg[red]%})%?%{$reset_color%}]:%~\${vcs_info_msg_0_}%# "

case "$(uname -s)" in
	Darwin)
		;;
	OpenBSD)
		alias 'gopatch=WRKDIST=$(make show=WRKSRC) make update-patches'
		alias cabal='env TMPDIR=/usr/local/cabal/build/ cabal'
		alias cdw='cd $(make show=WRKSRC)'
		alias irc="export TERM=xterm; tmux at -t irc"
		alias man='man -Owidth=$(($COLUMNS<80?($COLUMNS-2):78))'
		alias mutt='stty discard undef; neomutt'
		alias pkg_add="pkg_add -Dsnap"
		alias pkg_delete="pkg_delete -Dsnap"
		alias pup='doas -n /usr/sbin/pkg_add -u'
		;;
	*)
esac

alias ag='ag --nocolor'
alias ec='emacsclient -ct'
alias mkae='make'
alias pass="gopass"
alias rustc='rustc --color=never'
alias sbcl="rlwrap sbcl"
alias tmux="tmux -2"
alias dotconf="$(which git) --git-dir=$HOME/.dotconf --work-tree=$HOME"
