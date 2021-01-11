#!/bin/sh

if [[ -z $1 ]]; then
	vmctl status
else
	host=$(echo "$1" | awk '{print $NF}')
	state=$(echo "$1" | awk '{print $(NF-1)}')
	if [ "$state" == "stopped" ]; then
		vmctl start "$host"
	else
		vmctl stop "$host"
	fi
fi
