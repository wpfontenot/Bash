#!/bin/bash
#
# $HOME/.bash_profile.d/99-setterm.sh written by Paul Fontenot
#
###############################################################################
if [[ "$TERM" = linux ]]; then
        setterm --blank=0 --powerdown=0
fi