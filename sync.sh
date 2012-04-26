echo "Fix this so it checks changes first!"
#!/bin/bash

echo 'Make all files readable'
find ./ -type f -print0 | xargs -0 chmod 644
echo 'Make all script files executable'
find ./ -name "*.sh" -print0 | xargs -0 chmod u+x

echo 'Make all directories executable'
find ./ -type d -print0 | xargs -0 chmod 711

rsync -avP --delete --exclude=".hg" --delete-excluded ./. naturalcapitalproje@naturalcapitalproject.org:public_html
