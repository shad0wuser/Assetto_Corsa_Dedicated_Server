#!/bin/bash

server_root=~/Steam/assetto
startme() {
	cd $server_root
	nohup ./acServer 1> /dev/null 2> /dev/null &
	cd plugins/minorating/
	nohup mono MinoRatingPlugin.exe 1> /dev/null 2> /dev/null &
}

stopme() {
	pkill "acServer"
	pkill "mono"
}

case "$1" in
	start)		startme ;;
	stop)		stopme ;;
	restart)	stopme; startme ;;
	*)	echo "Usage: $0 start|stop|restart" >&2
		exit 1
	;;
esac
