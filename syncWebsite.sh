#!/bin/zsh

rsync -avz ~/Documents/github/sunzhe.info/public/ root@sunzhe.info:/var/www/sunzhe.info/ --delete
