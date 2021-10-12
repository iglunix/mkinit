#!/bin/sh
_=0 mkdir -p /tmp/init.d && make -j4 -f $0 $@ && exit

/tmp/init.d/mnt:
	/etc/init.d/mnt
	mkdir -p /tmp/init.d
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
