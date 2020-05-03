install:
	install -m 755 -o root -g root usb3to2 $(DESTDIR)/usr/bin/
	install -m 644 -o root -g root usb3to2.service $(DESTDIR)/etc/systemd/system/
	@systemctl enable usb3to2.service

help:
	@echo "Install library: make install"