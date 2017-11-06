#!/bin/bash

server_root=~/Steam/assetto
startme() {
	cd $server_root/plugins/minorating
	nohup mono MinoRatingRoot.exe 1> /dev/null 2> /dev/null &
}

stopme() {
	pkill "mono"
}

statusme() {
	tail -f $server_root/plugins/minorating/log/minoplugin.txt
}

case "$1" in
	start)		startme ;;
	stop)		stopme ;;
	restart)	stopme; startme ;;
	status)		statusme ;;
	*)		echo "Usage $0 start|stop|restart|status" >&2
			exit 1
			;;
esac
