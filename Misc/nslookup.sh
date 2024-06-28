#!/bin/bash
#
# /usr/local/scripts/nslookup.sh written by Paul Fontenot
#
###############################################################################
COUNTER=1
NETWORK=192.168.0

while [ "$COUNTER" -lt 255 ]
do
	ping -c 3 "$NETWORK"."$COUNTER"
	nslookup "$NETWORK"."$COUNTER" | grep name | awk -F ' ' '{ print $4 }' >> ip-addresses.txt
	((COUNTER++))
done