#	$OpenBSD$

FILES=		config
SCRIPTS=	sway-lock

realinstall:
	@echo installing ${FILES}
	@for i in ${FILES}; do \
		cmp -s $$i /etc/sway/$$i || \
			${INSTALL} ${INSTALL_COPY} -m 444 $$i /etc/sway/$$i; \
	done
	@echo installing ${SCRIPTS}
	@for i in ${SCRIPTS}; do \
        	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
			$$i /usr/local/bin/$$i; \
	done
.include <bsd.prog.mk>
