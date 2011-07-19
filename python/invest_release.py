#! /usr/bin/python
import sys

dl_version = sys.argv[1] #"2.2"
dl_location = sys.argv[2] #"http://invest-natcap.googlecode.com/files/InVEST_2.2_beta-upgrade.exe"

f = open("InVEST_download.template")
output = open("download.html", "w")
#read the desired file in to a string
page = f.read()
f.close()

#use a builtin python search/replace function to replace the substrings with correct data
page = page.replace("{{{{INVEST_VERSION}}}}", dl_version)
page = page.replace("{{{{INVEST_DL_LOC}}}}", dl_location)

#print the string to the correct file.
output.write(page) 

