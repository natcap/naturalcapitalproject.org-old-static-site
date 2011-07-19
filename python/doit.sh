#!/bin/bash

if [-z $1 ]; 
then
	echo "version number required as arg1";
	exit 2;
else
	echo "version " $1 
fi


if [ -z $2 ];
then
	echo "URL required as arg2"
	exit 2;
else
	echo "Download link URL: " $2
fi


if [ -z $3 ]; 
then
	echo "copy destination required as arg3";
	exit 2;
else
	echo "Destination: " \$3
fi



./invest_release.py $1 $2

#$? checks the error code of the last executed command
if [ $? != 0 ]; 
then
	echo "release script returned with nonzero exit code";
	echo "exiting";
	exit 1;
fi

scp ./*.html $3
