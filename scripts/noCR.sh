#!/bin/bash
#
#
#
###############################################################################
scripts=$( find . -type f )
echo ""

printf "Found:\n %", "$scripts"
printf "\n\n"

for script in $scripts
do
	printf "Removing carriage return from: %", "$script"
	tr "$(printf '\d') $(printf '\r')" "$script"
done
