#	$OpenBSD$

PREFIX ?=	/usr/local
SCRIPT =	git-credential-netrc.perl
BINDIR ?=	${PREFIX}/bin

update:
	ftp https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc.perl

realinstall:
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
		${.CURDIR}/${SCRIPT} ${DESTDIR}${BINDIR}/git-credential-netrc

.include <bsd.prog.mk>
