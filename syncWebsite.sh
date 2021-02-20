#!/bin/bash

rsync -auvzP --delete ~/Documents/website/sunzhe.co/ root@sunzhe.co:/var/www/sunzhe.co/
