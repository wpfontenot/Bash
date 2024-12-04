#!/bin/bash
#
# Old cron entry:
# 59 23 * * * /usr/sbin/pflogsumm -u 5 -h 5 --problems_first -d today /var/log/mail.log | mail -s "No Hope (Predator) pflogsumm report `date`" root
#
# Variables
PFLOG="/usr/sbin/pflogsumm" 
PFLOG_OPTS="-u 5 -h 5 --problems_first -d today"
DATE="/usr/bin/date +%m/%d/%Y"
MAILLOG="/var/log/mail.log" 
MAIL="/usr/bin/mail" 
MAIL_OPTS="-s"
SUBJECT="No Hope (Predator) pflogsumm report $($DATE)"
RECIPIENTS="root"
#
# Function Junction
function mail_report() {
	"$PFLOG"  "$PFLOG_OPTS" "$MAILLOG" | "$MAIL" "$MAIL_OPTS" "$SUBJECT" "$RECIPIENTS"
}
#
# Run it
mail_report