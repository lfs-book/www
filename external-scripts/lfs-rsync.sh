#!/bin/bash

SITE=linuxfromscratch.org
MODULE=lfs-website
LOCAL=/path/to/local/site	# Edit this line
USER=your@email.address		# Edit this line
MAILER=/usr/sbin/sendmail	# Edit this line, if necessary

OUTPUT=`rsync -clprtzv --delete ${SITE}::${MODULE} ${LOCAL} 2>&1`

# Run the command and mail the results
(echo -e "Subject: LFS HTTP Mirror Updated - exitcode = $?\n"; echo -e "${OUTPUT}") | ${MAILER} ${USER};
