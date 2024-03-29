#!/bin/sh
export OHMYKSH_DIR=${HOME}/src/ohmyksh
. ${OHMYKSH_DIR}/ohmy.ksh

set -A my_paths -- \
	/usr/ports/infrastructure/bin \
	~/bin \
	~/go/bin \
	/usr/local/plan9/bin

paths "${my_paths[@]}"

mv ~/Downloads ~/.tdownloads && \
	mkdir ~/Downloads
rm -rf ~/.tdownloads &

# Disable coredumps
#ulimit -Sc 0

cat /dev/null > ~/.xsession-errors

LC_CTYPE="en_US.UTF-8"
TERM=screen-256color
BROWSER=$(which xdg-open 2>/dev/null)
export LC_CTYPE TERM BROWSER

TIMEOUT=$(cat ~/.xtimeout 2> /dev/null || echo "300")

OS=$(uname)
LPREFIX=/usr/local

wmanager=$(cat ~/.wmanager 2> /dev/null || echo "/usr/X11R6/bin/cwm")

if [ $OS != "OpenBSD" ]; then
	LPREFIX=/usr
fi

load_extension fonts
which keychain 2>&1 > /dev/null && load_extension keychain

xrdb -merge -load ~/.Xresources &

if [ -x ${LPREFIX}/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
        eval `dbus-launch --sh-syntax --exit-with-session`
fi

case "$wmanager" in
	/home/qbit/bin/juicebox)
		xsetroot -solid black
		;;
	/usr/X11R6/bin/cwm|/usr/local/bin/spectrwm)
		while true; do ~/bin/bar; sleep 3; done | lemonbar-xft -d \
			-f "$Go Mono:pixelsize=12" \
			-B "#FFFFEA" \
			-F "#000000" | sh &
		xidle -delay 5 -program "/usr/X11R6/bin/xlock" -timeout $TIMEOUT &
		/usr/X11R6/bin/xcompmgr &
		;;
	/usr/local/bin/xfce4-session)
		dbus-monitor --session "type='signal',interface='org.xfce.ScreenSaver'" | \
		while read x; do
			case "$x" in
				*"boolean true"*)
					echo "Locked - clearing keys"
					/usr/bin/ssh-add -D;
					/usr/local/bin/rbw lock;
					/usr/local/bin/sudo -K
					;;
			esac
		done &
		;;
	/usr/local/bin/awesome)
		xsetroot -solid black
		;;
	xmonad)
		hsetroot -center ~/.background.jpg &
		xidle -delay 5 -program "/usr/X11R6/bin/xlock" -timeout $TIMEOUT &
		;;
	/usr/X11R6/bin/fvwm)
		echo "fvwm init from InitFunction"
		;;
esac


if [ -f ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap &
fi

if [ -d /usr/local/plan9/ ]; then
	pgrep -q fontsrv || (/usr/local/plan9/bin/fontsrv &)
	pgrep -q plumber || (/usr/local/plan9/bin/plumber &)
fi

sctd 3500 &

for tool in tpb xbanish scmpc autocutsel keychain fido; do
	if [ -e "${LPREFIX}/bin/${tool}" ]; then
		case "${i}" in
			sctd)
				${LPREFIX}/bin/sctd 3500
				;;
			tpb)
				${LPREFIX}/bin/tpb -d
				;;
			keychain)
				${LPREFIX}/bin/keychain --gpg2 --inherit any --agents ssh,gpg -q -Q
				keychain_conf="$HOME/.keychain/$(uname -n)-sh"

				# shellcheck source=/home/qbit/.keychain/slip.bold.daemon-sh
				[ -e "${keychain_conf}" ] && . ${keychain_conf}

				# shellcheck source=/home/qbit/.keychain/slip.bold.daemon-sh-gpg
				[ -e "${keychain_conf}-gpg" ] && . ${keychain_conf}-gpg
				;;
			*)
				${LPREFIX}/bin/${tool} &
				;;
		esac
	fi
done

exec "$wmanager"
