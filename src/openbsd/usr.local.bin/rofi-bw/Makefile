#	$OpenBSD$

PREFIX ?=	/usr/local
SCRIPT =	rofi-bw.sh
BINDIR ?=	${PREFIX}/bin

realinstall:
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
		${.CURDIR}/${SCRIPT} ${DESTDIR}${BINDIR}/rofi-bw

.include <bsd.prog.mk>
