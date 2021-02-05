#!/bin/bash

mount_point=$(lsblk | grep sd |sed -n '2 p' | awk -F" " {'print $7'})
backup_dir="$mount_point/sz96-backup"

rsync -auvzP ~/Documents ~/org-roam ~/Audio ~/.emacs.d ~/Dropbox $backup_dir --delete

read -sr -n 1 -p "Do you want to umount the backup device?(Y/n)" choice
printf "\n"

case "$choice" in
    n|N ) echo "backup finished";;
    * ) sudo umount "$mount_point" && echo "backup finished";;
esac

