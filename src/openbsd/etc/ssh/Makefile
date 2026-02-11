#	$OpenBSD$

FILES=	sshd_config \
	ssh_known_hosts

realinstall:
	@echo installing ${FILES}
	@for i in ${FILES}; do \
		cmp -s $$i /etc/ssh/$$i || \
			${INSTALL} ${INSTALL_COPY}} -m 444 /etc/ssh/$$i; \
	done
.include <bsd.prog.mk>
