#!/bin/bash

./invest_release.py $1 $2

scp ./*.html naturalcapitalproject.org
