#!/bin/bash

sudo mount /dev/sdc1 ~/media

backup_dir=$(lsblk | grep sdc1 | awk -F" " {'print $7'})/sz96-backup

rsync -auvzP ~/Documents ~/org-roam ~/Audio ~/.emacs.d ~/Dropbox $backup_dir --delete --log-file=mylog.log

echo 'Do you want to umount the backup device?(Y/n)'
read answer
if [ "$answer" == "Y" ]; then
    sudo umount ~/media
    echo "backup finished"
else
    echo "backup finished"
fi
