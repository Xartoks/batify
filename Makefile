UDEVDIR     = $(DESTDIR)/etc/udev/rules.d
UDEVRULE    = 99-batify.rules
BINDIR		= /usr/local/bin
NOTIF_FILE  = batify.sh

$(XPUB):
	$(error xpub: submodule not found.)

install: $(XPUB)
	mkdir  -p $(UDEVDIR)
	mkdir  -p $(BINDIR)
	chmod 644 $(UDEVRULE)
	cp $(UDEVRULE) $(UDEVDIR)/$(UDEVRULE)
	cp $(NOTIF_FILE) $(BINDIR)/batify 
	udevadm control --reload-rules

uninstall:
	$(RM) $(UDEVDIR)/$(UDEVRULE)
	$(RM) $(BINDIR)/batify

.PHONY: install uninstall
