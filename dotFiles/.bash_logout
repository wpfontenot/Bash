#!/bin/bash
#
# $HOME/.bash_logout written by Paul Fontenot
#
#############################################################################
if [ -d "$TMPDIR" ]; then
        cd "$TMPDIR" || exit
        rm -rf ./* > /dev/null 2>&1
        rm -rf ./.??* > /dev/null 2>&1
        cd || exit
else
        # echo "$TMPDIR missing, creating $TMPDIR"
        mkdir -p "$TMPDIR"
fi
spin
#
# Just a second... No modifications below here
# when leaving the console clear the screen to increase privacy
#
# Reset setterm values to avoid a display that won't turn off
#############################################################################
setterm --blank=1 --powerdown=3
#
#############################################################################
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi