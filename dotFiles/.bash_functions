#!/bin/bash
#
# $HOME/.bash_functions written by Paul Fontenot
#
###############################################################################
function pingSweep() {
        nmap -sn 192.168.0.0/24 | grep --color=never report
}
function updateProfile() {

        for SERVERS in "thing2.local" "head.local"
        do
                rsync "$RSYNC_OPTS" "$HOME"/.bashrc "$USER"@"$SERVERS":.
                rsync "$RSYNC_OPTS" "$HOME"/.bash_aliases "$USER"@"$SERVERS":.
                rsync "$RSYNC_OPTS" "$HOME"/.bash_functions "$USER"@"$SERVERS":.
                rsync "$RSYNC_OPTS" "$HOME"/.bash_logout "$USER"@"$SERVERS":.
                rsync "$RSYNC_OPTS" "$HOME"/.bash_profile "$USER"@"$SERVERS":.
                rsync "$RSYNC_OPTS" "$HOME"/.bash_profile.d "$USER"@"$SERVERS":.
                rsync "$RSYNC_OPTS" "$HOME"/bin "$USER"@"$SERVERS":.
        done
}
function cMatrix() {
	typeset cmatrix
	cmatrix="/usr/bin/cmatrix"
	
	if [[ -f "$cmatrix" ]]; then
                "$cmatrix" -abs -C blue
	else
		printf "Package cmatrix is not installed, it can be installed by issuing the command \'sudo apt install cmatrix cmatrix-xfont\'"
	fi
}
function spin() {
        counter=0

        local i=o
        local sp='/-\|'
        local n=${#sp}
        printf ' '
        sleep 0.1

        until [[ "$counter" -gt 25 ]]
        do
                ((counter++))

                printf '\b%s' "${sp:i++%n:1}"
                sleep 0.1
        done
}