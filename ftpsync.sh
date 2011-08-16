#!/bin/bash    
HOST="naturalcapitalproject.org"
USER="username"
PASS="password"
LCD="."
RCD="public_html/"
lftp -c "set ftp:list-options -a;
open ftp://$USER:$PASS@$HOST; 
lcd $LCD;
cd $RCD;
mirror --reverse \
       --delete \
       --verbose \
       --exclude-glob a-dir-to-exclude/ \
       --exclude-glob a-file-to-exclude \
       --exclude-glob a-file-group-to-exclude* \
       --exclude-glob other-files-to-esclude"