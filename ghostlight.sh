#!/bin/bash

trap "xset dpms" SIGINT

argument=$1

checkDPMS()
{
	dpmsStatus=`xset -q | grep -ce 'DPMS is Enabled'`
}

checkArgument()
{
	re='^[0-9]+$'

	if [[ $argument =~ $re ]];then
		delay=$argument
		echo "DPMS disabled for $delay minute(s)"
		xset -dpms	
		sleep ${delay}m
		xset dpms
		echo "DPMS has been re-enabled"

	else
		echo $dpmsStatus
	fi
}

checkDPMS
checkArgument
