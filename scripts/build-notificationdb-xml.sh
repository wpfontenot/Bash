#!/bin/bash
#
COUNTER=0
DATE=$(/usr/bin/date +"%F %H:%M:%S")
DATE2=$(/usr/bin/date +"%F-%H:%M:%S")
EVENTIDS=${HOME}/notifications.txt
NAME="Event IDs"
CONF_DIR=/etc/nxlog.d
OUTPUT=${CONF_DIR}/notificationdb.xml
A_OUTPUT=${CONF_DIR}/archives/notificationdb.xml-${DATE2}
old_IFS=${IFS}
IFS=$'\n'

/usr/bin/mv -f ${OUTPUT} ${A_OUTPUT}

echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" >> ${OUTPUT}
echo "<patterndb>" >> ${OUTPUT}
echo "<created>${DATE}</created>" >> ${OUTPUT}
echo "<version>4</version>" >> ${OUTPUT}
echo "" >> ${OUTPUT}
echo "<group>" >> ${OUTPUT}
echo "<name>${NAME}</name>" >> ${OUTPUT}
echo "<id>1</id>" >> ${OUTPUT}
echo "" >> ${OUTPUT}

for i in $(cat $EVENTIDS)
do
        ((COUNTER++))
        echo "<pattern>" >> ${OUTPUT}
        echo "<id>$COUNTER</id>" >> ${OUTPUT}
        echo "<name>""$i""</name>" >> ${OUTPUT}
        echo "" >> ${OUTPUT}
        echo "<matchfield>" >> ${OUTPUT}
        echo "<name>Message</name>" >> ${OUTPUT}
        echo "<type>REGEXP</type>" >> ${OUTPUT}
        echo "<value>""$i""</value>" >> ${OUTPUT}
        echo "</matchfield>" >> ${OUTPUT}
        echo "" >> ${OUTPUT}
        echo "<exec>drop();</exec>" >> ${OUTPUT}
        echo "</pattern>" >> ${OUTPUT}
        echo "" >> ${OUTPUT}
done

echo "</group>" >> ${OUTPUT}

echo "</patterndb>" >> ${OUTPUT}

/usr/bin/systemctl stop nxlog
/usr/bin/systemctl start nxlog

IFS=${old_IFS}
