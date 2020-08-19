#	$OpenBSD$

SCRIPT =	attach

realinstall:
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
		${.CURDIR}/${SCRIPT} /etc/hotplug/attach

.include <bsd.prog.mk>
