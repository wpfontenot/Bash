#!/bin/bash
#
# Variable declarations
###############################################################################
EMAIL=YES

PKIETC=/usr/local/etc/pki
PKISBIN=/usr/local/sbin/pki
RANDFILE=/var/run/.rnd

ENCCERTS=$(ls ${PKIETC}/divlog/rcpt/*)
SIGCERTS=$(ls ${PKIETC}/divlog/from/*)
EXCLUDES=$(ls ${PKIETC}/divlog/pattern/general/* | sed 's/^/-f /g')

FROM="$(echo $SIGCERTS | sed -e 's#/usr/local/etc/pki/divlog/from/##g')"
RCPT="$(echo $ENCCERTS | sed -e 's#/usr/local/etc/pki/divlog/rcpt/##g' -e 's/ /, /g')"
SUBJECT="PKI ExpressNet Logs (PROD)"

DATE="$(date '+%Y%m%d')"
FILEPRE="/var/shadow"
FILESRC="${1:-'/var/log/wfsc-pki'}"
FILETMP="${FILEPRE}/${DATE}"

MAIL="/bin/mail"

export RANDFILE

subtract() {
    dc << EOM
$1 $2 - p
EOM
}
#
#
#
# Functions
###############################################################################
logpart() {

	EXPATS="$EXCLUDES"

   	if [ -f ${PKIETC}/divlog/pattern/host/${2}.re ]; then
        	EXPATS="$EXPATS -f ${PKIETC}/divlog/pattern/host/${2}.re"
    fi

   	echo "*** LOG FOR $2 ***"
	echo "-----------------------------"
    
	if [ "x$EXPATS" != "x" ]; then
       	grep -v $EXPATS $1/$2/$3 | sed 's/^/  /'
    else
       	cat $1/$2/$3 | sed 's/^/  /'
    fi
	
    echo "============================="
    echo
	
}

divlogs() {

	if [ "$1." != "." -a "$2." != "." -a "$3." != "." ]; then

		MACHINES=$(cut -c17- $1 | cut -f1 -d' ' | sort | uniq)
    
		for j in $MACHINES; do
   
			mkdir -p $2/${j}
			chmod 0700 $2/${j}
			grep "^................$j" $1 > $2/${j}/$3
			##########################################
		
				if [ $EMAIL = "YES" ]; then
					logpart $2 ${j} $3
				fi
		
			##########################################
			bzip2 $2/${j}/$3
			openssl dgst -sign "$SIGCERTS" -out $2/${j}/${3}.sig $2/${j}/${3}.bz2
		#
		done
	fi
}

EMAIL=$(echo $EMAIL | tr '[a-z]' '[A-Z]')

# Create the shadow directory, if needed
mkdir -p ${FILEPRE}

# Create the email and log directorys if needed
mkdir -p /var/audit/emails
mkdir -p /var/audit/logs

# Seperate the machine logs
if [ $EMAIL = "YES" ]; then
    umask 077
    divlogs ${FILESRC} ${FILEPRE} ${DATE} > ${FILETMP}.msgi
	
    openssl smime -sign -text -in ${FILETMP}.msg -signer "$SIGCERTS" | \
        openssl smime -encrypt -des3 -to "$RCPT" -from "$FROM" -subject \
        "$SUBJECT" $ENCCERTS | ${PKISBIN}/ssmtp.pl > /dev/null 2>&1
    
	[ $? -eq 0 ] && tar cvfz /var/old.logs/${HOSTNAME}/emails/${DATE}.msg.tar.gz ${DATE}.msg
    
	${MAIL} -s "${HOSTNAME} log data" < ${FILETMP}.msg
    
	tar -czf /var/audit/emails/${DATE}.msg.tar.gz ${FILETMP}.msg
else
    divlogs ${FILESRC} ${FILEPRE} ${DATE} > /dev/null 2>&1
fi

# Bundle the logs
tar -zcf /var/audit/logs/logs-${DATE}.tar ${FILEPRE}/*/${DATE}.{bz2,sig}

# Transfer the logs and signature to the backup machine
DIR=$(echo $DATE | sed 's/^\(....\)\(..\).*/\1\/\2/')
scp -q /tmp/logs-${DATE}.tar "backup@backup:`hostname -s`/${DIR}"

if [ $? -eq 0 ]; then
	rm -f /tmp/logs-${DATE}.tar
	ssh -l backup backup touch `hostname -s`.ok > /dev/null 2>&1
fi