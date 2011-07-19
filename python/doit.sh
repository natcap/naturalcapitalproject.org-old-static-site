#!/bin/bash

./invest_release.py $1 $2

#$? checks the error code of the last executed command
if [ $? != 0 ]; then
	echo "release script returned with nonzero exit code";
	echo "exiting";
	exit 1;
fi

scp ./*.html naturalcapitalproje@naturalcapitalproject.org:~/
