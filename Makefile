.POSIX:

install:
	install -d $(DESTDIR)/lib/init.d
	install -d $(DESTDIR)/etc/init.d
	install -Dm755 ./rc.mk $(DESTDIR)/etc/init.d/
	install -Dm755 ./super.sh $(DESTDIR)/lib/init.d/
