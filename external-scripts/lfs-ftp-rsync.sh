#!/bin/sh
# This script rsyncs a directory with a server and will log and mail the
# output to a user. 
# Parameters are needed in this order:

NAME="LFS ftp archive"
SITE=rsync.osuosl.org
MODULE=lfs
LOCAL=/local/path/
LOG=/path/to/logfile
USER=root  
MAILER=/usr/bin/your_favorite_mailer

OUTPUT=`rsync -clprtz --delete ${SITE}::${MODULE} ${LOCAL} 2>&1`

if [ $? = 0 ]
then
    echo "Subject: rsync of ${NAME} on igwe.vub.ac.be OK" |${MAILER}
${USER};
    echo "Rsync succeeded of ${NAME} on" `date` >> ${LOG}
else
    (echo "Subject: rsync of ${NAME} on igwe.vub.ac.be FAILED"; echo -e "${OUTPUT}") |${MAILER} ${USER};
    echo "Rsync failed of ${NAME} on" `date` >> ${LOG};
    echo -e "${OUTPUT}" >> ${LOG}
fi


