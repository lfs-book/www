#!/bin/bash

HTMLDIR=/var/www/htdocs/lfssite

cd $HTMLDIR/timestamp
oldstamp=$(cat timestamp)

rsync -cr linuxfromscratch.org::lfs-timestamp .

newstamp=$(cat timestamp)

if [ $newstamp -gt $oldstamp ]; then
	rsync -clprtz --delete linuxfromscratch.org::lfs-website $HTMLDIR
fi

