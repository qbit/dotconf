#	$OpenBSD$

SCRIPT =	attach

realinstall:
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
		${.CURDIR}/${SCRIPT} /etc/hotplug/attach
	rcctl enable hotplugd
	rcctl start hotplugd

.include <bsd.prog.mk>
