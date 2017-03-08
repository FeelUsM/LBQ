#!/bin/sh

TASKDIR=LinuxBeginnerQuest
if [ -e $TASKDIR ]; then
	if [ `uname | grep -i cygwin` ]; then
		find . * 2> /dev/null | xargs chmod 777 &> /dev/null
		find . * 2> /dev/null | xargs chmod 777 &> /dev/null
	else
		find . * 2> /dev/null | xargs chmod 700 &> /dev/null
		find . * 2> /dev/null | xargs chmod 700 &> /dev/null
	fi
#    chmod -R 700 $TASKDIR
    rm -rf $TASKDIR
fi
