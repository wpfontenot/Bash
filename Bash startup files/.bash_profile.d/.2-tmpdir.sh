#!/bin/bash
#
# $HOME/.bash_profile.d/2-tmpdir.sh written by Paul Fontenot
#
###############################################################################
# Handling the $TMPDIR                                                        #
###############################################################################
if [ ! -d "$TMPDIR" ]; then
        # echo "Creating missing $TMPDIR"
        mkdir -p "$TMPDIR"
fi