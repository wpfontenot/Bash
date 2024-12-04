#!/usr/bin/env bash
#
#
#
###############################################################################
COUNT=0
DISKS=( $(fdisk -l /dev/sd[d-z] | grep "Disk /dev/sd" | awk -F ':' '{ print $1 }' | awk -F ' ' '{ print $NF }') )

for disk in "${DISKS[@]}"
do
	echo "Disk $COUNT: $disk"
	sgdisk --clear "$disk"
	sgdisk --new=1:0:0 --typecode=1:8300 "$disk"
	echo Y | mke2fs -D -v -t ext4 "$disk"1
	((COUNT++))
	echo ""
done
