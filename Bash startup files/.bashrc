#!/bin/bash
#
# $HOME/.bashrc written by Paul Fontenot
#
# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022
#
# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto --group-directories-first'
eval "$(dircolors)"

###############################################################################
# My modifications below                                                      #
#                                                                             #
# Common variables I load up here. Script specific variables will be in the   #
# scripts they are used for                                                   #
# #############################################################################
BASHDIR="$HOME"/.bash_profile.d
EDITOR=vim
PATH="$PATH":/usr/local/scripts:"$HOME"/bin
RSYNC_OPTS="--progress -avzh"
TMPDIR="$HOME"/tmp

export BASHDIR EDITOR PATH RSYNC_OPTS TMPDIR
###############################################################################
# Aliases and functions...                                                    #
###############################################################################
if [ -f "$HOME"/.bash_aliases ]; then
        # shellcheck source=/dev/null
        source "$HOME"/.bash_aliases
fi
if [ -f "$HOME"/.bash_functions ]; then
        # shellcheck source=/dev/null
        source "$HOME"/.bash_functions
fi