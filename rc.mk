#!/bin/make -j4 -f

/tmp/init.d/mnt:
	/etc/init.d/mnt
	touch /tmp/init.d/mnt

/tmp/init.d/mod: /tmp/init.d/mnt
	/etc/init.d/mod
	touch /tmp/init.d/mod

/tmp/init.d/net: /tmp/init.d/mnt /tmp/init.d/mod
	/etc/init.d/net
	touch /tmp/init.d/net

/tmp/init.d/telnetd: /tmp/init.d/net
	/lib/init.d/super.sh telnetd -F

/tmp/init.d/seatd: /tmp/init.d/mnt
	/lib/init.d/super.sh seatd
