#!/bin/zsh

backup_dir=$(lsblk | grep sda1 | awk -F" " {'print $7'})/sz96-backup

rsync -auvzP ~/Documents ~/org-roam $backup_dir --delete
