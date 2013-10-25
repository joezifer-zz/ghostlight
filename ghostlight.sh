#!/bin/bash

trap "xset dpms" SIGINT
trap "xset s on" SIGINT

argument=$1

checkDPMS()
{
	dpmsStatus=`xset -q | grep -ce 'DPMS is Enabled'`
	scrnsavStatus=`xset -q | grep -ce 'timeout:  600'`
}

checkArgument()
{
	re='^[0-9]+$'

	if [[ $argument =~ $re ]];then
		delay=$argument
		echo "DPMS and Screensaver disabled for $delay minute(s)"
		xset -dpms
		xset s off	
		sleep ${delay}m
		xset dpms
		xset s on
		echo "DPMS and Screensaver have been re-enabled"

	else
		echo $dpmsStatus
		echo $scrnsavStatus
	fi
}

checkDPMS
checkArgument
