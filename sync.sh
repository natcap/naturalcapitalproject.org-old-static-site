#!/bin/bash

echo 'Make all files readable'
find ./ -type f -print0 | xargs -0 chmod 644
echo 'Make all script files executable'
find ./ -name "*.sh" -print0 | xargs -0 chmod u+x

echo 'Make all directories executable'
find ./ -type d -print0 | xargs -0 chmod 755

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

rsync -avP --delete --exclude=".hg" --delete-excluded $CURRENT_DIR/. /var/www/naturalcapitalproject.org/public_html
#rsync -avP --delete --exclude=".hg" --delete-excluded ./. naturalcapitalproje@130.211.163.122:/var/www/naturalcapitalproject.org/public_html
#rsync -avP --delete --exclude=".hg" --delete-excluded ./. naturalcapitalproje@130.211.132.207:/var/www/naturalcapitalproject.org/public_html
#rsync -avP --delete --exclude=".hg" --delete-excluded ./. naturalcapitalproje@naturalcapitalproject.org:public_html
