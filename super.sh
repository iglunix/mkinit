#!/bin/sh
DIR=/tmp/init.d
mkdir -p $DIR
export NAME=$(basename $1)
touch $DIR/$NAME

if [ -z $_MKINIT ];
then
    echo starting $NAME
    _MKINIT=1 setsid -d $0 $@&
else
	$@&
	PID=$!
	echo $PID > $DIR/$NAME

	wait $PID
	rm $DIR/$NAME
fi
