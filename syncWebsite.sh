#!/bin/sh

domain="sunzhe.info"
localDir="$HOME/projects/sunzhe.info/public/"
serverDir="/var/www/sunzhe.info/"

rsync -auvzP --delete "$localDir" root@"$domain":"$serverDir"
