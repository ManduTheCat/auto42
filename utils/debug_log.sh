#!/bin/sh

function log()
{
	say=$1; debug=0;
	if [ $debug -eq 1 ]
	then
		echo $say
	fi
}

#log "hello"
