#! /usr/bin/python
import sys
import array

dl_version = sys.argv[1] #"2.2"
dl_location = sys.argv[2] #"http://invest-natcap.googlecode.com/files/InVEST_2.2_beta-upgrade.exe"

files = [[],[]]
files[0] = ['InVEST_download.template', 'download.html']
files[1] = ['homePage.template', 'home04.html']

for i in xrange(0,2):
    f = open(files[i][0])
    output = open(files[i][1], "w")
    
    #read the desired file in to a string and then close it
    page = f.read()
    f.close()
    
    #use a builtin python search/replace function to replace the substrings with correct data
    page = page.replace("{{{{INVEST_VERSION}}}}", dl_version)
    page = page.replace("{{{{INVEST_DL_LOC}}}}", dl_location)

    #print the string to the correct file.
    output.write(page) 
    output.close();

