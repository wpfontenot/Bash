#!/bin/bash
#
# $HOME/.bash_profile written by Paul Fontenot
#
###############################################################################
if [ "$BASH_VERSION" ]; then
        if [ -f "$HOME"/.bashrc ]; then
                # shellcheck source=/dev/null
                source "$HOME"/.bashrc
        fi
fi

mesg n 2> /dev/null || true
###############################################################################
# My modifications below                                                      #
###############################################################################
if [ -d "$BASHDIR" ]; then

        for FILE in "$BASHDIR"/*.sh
        do
                # shellcheck source=/dev/null
                source "$FILE"
        done

fi
