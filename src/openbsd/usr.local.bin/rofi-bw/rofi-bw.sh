#!/bin/sh

set -e

if rbw unlocked; then
	if [[ -z $1 ]]; then
		rbw list --fields folder,name | sort
	else
		rbw get "$(echo $1 | awk '{print $NF}')" | xclip -r -l 1
	fi
else
	echo "Unock rbw first!"
fi
