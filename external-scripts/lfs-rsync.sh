#!/bin/bash

SITE=linuxfromscratch.org
MODULE=lfs-website
LOCAL=/path/to/local/site	# Edit this line
USER=admin@<your domain here>	# Edit this line
MAILER=/usr/sbin/sendmail	# Edit this line, if necessary

OUTPUT=`rsync -clprtzv --delete ${SITE}::${MODULE} ${LOCAL}`

# Run the command and mail the results
(echo "Subject: LFS HTTP Mirror Updated - RC $?"; echo -e "${OUTPUT}") | ${MAILER} ${USER};
