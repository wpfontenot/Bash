#!/bin/bash
#
#
drives=$(/usr/sbin/smartctl --scan | cut -d' ' -f1)
recipient="ssdv688i@gmail.com"

for drives in $drives
do
	/usr/sbin/smartctl -t short "$drives"
	sleep 180
	/usr/sbin/smartctl -H "$drives" | /usr/bin/mail -s "{HOSTNAME $drives health" $recipient
done