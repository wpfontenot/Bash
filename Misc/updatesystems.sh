#!/bin/bash
#
# Variable declarations
#############################################################################
APT=/usr/bin/apt
#
# Functions
#############################################################################
function updateSystems() {
	${APT} -y update
	${APT} -y dist-upgrade --allow-downgrades
	${APT} -y autoremove
	${APT} -y autoclean
}
#
# Send it
#############################################################################
updateSystems
