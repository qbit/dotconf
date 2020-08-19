#	$OpenBSD$

PREFIX ?=	/usr/local
SCRIPT =	fido.pl
BINDIR ?=	${PREFIX}/bin

realinstall:
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
		${.CURDIR}/${SCRIPT} ${DESTDIR}${BINDIR}/fido

.include <bsd.prog.mk>
