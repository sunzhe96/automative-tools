#!/bin/zsh

backup_dir=$(lsblk | grep sda1 | awk -F" " {'print $7'} )

rsync -auvzP ~/Documents $backup_dir --delete
