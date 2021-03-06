#!/bin/bash
cd /var/temp/ntopng
echo -e "Checking for updates for ntopng.."
git remote update
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")
if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date. No need to continue."
    exit 0
elif [ $LOCAL = $BASE ]; then
    echo "Update available for ntopng - "
    echo "Pulling in 10 seconds. CTRL+C to cancel.."
    sleep 10
	echo "Stopping ntop service to update..."
    systemctl stop ntop.service
    git pull
	./autogen.sh
	./configure
	make
	make geoip
	make install
elif [ $REMOTE = $BASE ]; then
    echo "Looks like you modified ntopng, cannot update!"
    exit 0
else
    echo "Diverged. Oops."
    exit 0
fi
exit 0
