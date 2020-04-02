#!/bin/bash

ERROR_1="ping: google.com: Name or service not known"
count=0
while [ $count -le 3 ]
do
	echo $ERROR_1 > ping_test.txt 
        ping -w3 google.com > ping_test.txt
        sleep 1 
	 
	if [[ -s ping_test.txt ]];
       	then
	       	:
	else
       		notify-send -u CRITICAL -t 500 "`date +%H:%M:%S` - Device cannot reach google " ;
       	fi
done
