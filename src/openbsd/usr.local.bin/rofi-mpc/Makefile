#	$OpenBSD$

PREFIX ?=	/usr/local
SCRIPT =	rofi-mpc.sh
BINDIR ?=	${PREFIX}/bin

realinstall:
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
		${.CURDIR}/${SCRIPT} ${DESTDIR}${BINDIR}/rofi-mpc

.include <bsd.prog.mk>
