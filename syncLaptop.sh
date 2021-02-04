#!/bin/bash

mount_point=$(lsblk | grep sd |sed -n '2 p' | awk -F" " {'print $7'})
backup_dir="$mount_point/sz96-backup"

rsync -auvzP ~/Documents ~/org-roam ~/Audio ~/.emacs.d ~/Dropbox $backup_dir --delete --log-file=mylog.log

echo 'Do you want to umount the backup device?(Y/n)'
read answer
if [ "$answer" == "Y" ]; then
    sudo umount "$mount_point"
    echo "backup finished"
else
    echo "backup finished"
fi
