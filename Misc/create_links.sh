#!/usr/bin/bash
#
#
###############################################################################
function create_links() {

	for scripts in .includes/*; 
	do 
		files=$(echo "$scripts" | cut -d'/' -f2)
		ln -s "$scripts" ."$files"
	done
}
#############################################################################
# Send it                                                                   #
#############################################################################
create_links
