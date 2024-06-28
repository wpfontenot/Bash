#!/usr/bin/bash
#
#
# Variables
FSTAB=/etc/fstab
SWAP_DIR=/swapfiles
#
#
# Send it
echo "This will create the swapfiles you direct it to and store then in $SWAP_DIR ."
echo ""
echo "Number of swapfiles: "
read -r NEED
echo "Size of each swapfile: "
read -r SIZE
echo "Creating $NEED swapfiles that are $SIZE Gib each."
echo ""
echo "Getting to it"

NUMBER=1

echo "Each swapfile is: $SIZE Gib in size"
echo "Total swap space is: $(expr $NEED \* $SIZE)Gib"
sleep 2

until [ $NUMBER -gt "$NEED" ]
do
	mkdir -p "$SWAP_DIR"
	cd "$SWAP_DIR" || exit
	fallocate -l "$SIZE"g swapfile."$NUMBER"
	chmod 0600 swapfile."$NUMBER"
	mkswap swapfile."$NUMBER"
	ls -ald swapfile."$NUMBER"
	sleep 2
	echo "$SWAP_DIR/swapfile.$NUMBER none swap pri==$NUMBER	0	0" >> "$FSTAB"
	swapon swapfile."$NUMBER"
	((NUMBER=NUMBER+1))
done

more "$FSTAB"
