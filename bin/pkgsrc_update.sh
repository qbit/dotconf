#!/bin/sh

export OSX_TOLERATE_SDK_SKEW=yes

(
	cd ~/pkgsrc && git pull

	pkg_rolling-replace -F -uv -X pkg_install

	echo "continue? (y/n)"
	read cont

	if [ "${cont}" = "y" ]; then
		pkg_rolling-replace -uv -X pkg_install
	else
		exit 0;
	fi
)
