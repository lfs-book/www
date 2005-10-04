#!/bin/sh
# This script rsyncs a directory with a server and will log and mail the
# output to a user. 
# Parameters are needed in this order:

NAME="LFS LiveCD FTP Archive"
SITE=rsync.osuosl.org
MODULE=lfs-livecd
LOCAL=/local/path/   			# Edit this line
LOG=/path/to/logfile 			# Edit this line
USER=root  
MAILER=/usr/bin/your_favorite_mailer 	# Edit this line

OUTPUT=`rsync -lprtz --delete ${SITE}::${MODULE} ${LOCAL} 2>&1`

if [ $? = 0 ]
then
    echo "Subject: rsync of ${NAME} OK" |${MAILER} ${USER};
    echo "Rsync succeeded of ${NAME} on" `date` >> ${LOG}
else
    (echo "Subject: rsync of ${NAME} FAILED"; echo -e "${OUTPUT}") |${MAILER} ${USER};
    echo "Rsync failed of ${NAME} on" `date` >> ${LOG};
    echo -e "${OUTPUT}" >> ${LOG}
fi
