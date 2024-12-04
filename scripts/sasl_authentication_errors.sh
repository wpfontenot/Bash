#!/bin/bash
#
# Unset PATH
unset PATH
# Variables
CUT="/usr/bin/cut"
GREP="/bin/grep"
LOG="/var/log/mail.log.1"
MAIL="/usr/bin/mail"
SORT="/usr/bin/sort"
UNIQ="/usr/bin/uniq"
VALUE="authentication failed"

$GREP "${VALUE}" ${LOG} | ${CUT} -d "[" -f 3 | ${CUT} -d "]" -f 1 | ${SORT} -n | ${UNIQ} -c | $MAIL -s "SASL Failures for ${HOSTNAME}" root
