#!/bin/bash

rsync -auvzP --delete ~/Documents/website/sunzhe.info/ root@sunzhe.info:/var/www/sunzhe.info/
