#!/bin/sh
# This script rsyncs a directory with a server and will log and mail the
# output to a user. 
# Parameters are needed in this order:

NAME="BLFS FTP Archive"
SITE=rsync.osuosl.org
MODULE=blfs
LOCAL=/local/path/				# Edit this line
LOG=/tmp/blfs_rsync-`date +%Y%m%d%H%M%S`	# Edit this line, if necessary
USER=your@email.address				# Edit this line
MAILER=/usr/sbin/sendmail			# Edit this line, if necessary

OUTPUT=`rsync -lprtz --delete ${SITE}::${MODULE} ${LOCAL} 2>&1`

if [ $? = 0 ]
then
    echo -e "Subject: rsync of ${NAME} OK\n" |${MAILER} ${USER};
    echo "Rsync of ${NAME} succeeded on" `date` >> ${LOG}
else
    (echo -e "Subject: rsync of ${NAME} FAILED\n"; echo -e "${OUTPUT}") |${MAILER} ${USER};
    echo "Rsync of ${NAME} failed on" `date` >> ${LOG};
    echo -e "${OUTPUT}" >> ${LOG}
fi
