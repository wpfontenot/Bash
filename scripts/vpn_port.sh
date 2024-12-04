#!/usr/bin/bash
#
#
DATE=$(/bin/date)
LOG="/var/log/vpn_port.log"
PID_FILE="/run/deluge/deluge.pid"
PORT=$(/usr/bin/python /usr/local/scripts/python-port-test.py)

unset PATH

if [ -f "${PID_FILE}" ]; then
	echo "${DATE} VPN port in use is: ${PORT}" >> ${LOG}
fi
