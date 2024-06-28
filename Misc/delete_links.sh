#!/bin/bash
#
#
############################################################################
#                                                                          #
# Your general functions can go below this area                            #
#                                                                          #
############################################################################
function delete_links() {
	
	for scripts in .includes/*; 
	do 
		# echo $scripts
		files=$(echo "$scripts" | cut -d'/' -f2)
		echo "Deleting $files..."
		unlink ."$files"
	done
}
#
# Send it
#############################################################################
delete_links
