if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

PLAN9=/usr/local/plan9/
if [ -d ~/src/plan9port ]; then
	PLAN9=~/src/plan9port
fi
export PLAN9

if [ -d ~/opt/GNAT/2020/bin ]; then
	GNAT=~/opt/GNAT/2020
fi
export GNAT

for p in "${HOME}/opt/bin" "${HOME}/opt/sbin" "${GNAT}/bin" "${PLAN9}/bin" "${HOME}/go/bin" "${HOME}/bin" "${HOME}/tinygo/bin" /Applications/Emacs.app/Contents/MacOS/bin; do
	if [ -d $p ]; then
		PATH="${PATH}:$p"
	fi
done

export PATH

# That sweet sweet ^W
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

autoload -Uz compinit && compinit
autoload -Uz vcs_info
autoload -Uz colors && colors
#[ -n "$BASH" ] && complete -F _fzf_complete_doge -o default -o bashdefault doge

export GPG_AGENT_INFO="~/.gnupg/S.gpg-agent:$(pgrep gpg-agent):1"
if which -s keychain >/dev/null; then
	keychain --inherit any --agents ssh,gpg -q -Q
fi
MYNAME=$(uname -n)
[[ -f ~/.keychain/${MYNAME}-sh ]] && . ~/.keychain/${MYNAME}-sh
[[ -f ~/.keychain/${MYNAME}-sh-gpg  ]] && . ~/.keychain/${MYNAME}-sh-gpg

#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )

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

alias vi=nvim
alias ag='ag --nocolor'
alias ec='emacsclient -ct'
alias mkae='make'
alias pass="gopass"
alias rustc='rustc --color=never'
alias sbcl="rlwrap sbcl"
alias yaegi="rlwrap yaegi"
alias tmux="tmux -2"
alias dotconf="$(which git) --git-dir=$HOME/.dotconf --work-tree=$HOME"
alias ocvs='cvs -dabieber@cvs.openbsd.org:/cvs'

eval "$(direnv hook zsh)"
