#!/bin/zsh

backup_dir=$(lsblk | grep sda1 | awk -F" " {'print $7'} )

rsync -avc ~/Documents $backup_dir --delete
