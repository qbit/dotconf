#	$OpenBSD$

PREFIX ?=	/usr/local
SCRIPT =	rofi-vmctl.sh
BINDIR ?=	${PREFIX}/bin

realinstall:
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
		${.CURDIR}/${SCRIPT} ${DESTDIR}${BINDIR}/rofi-vmctl

.include <bsd.prog.mk>
