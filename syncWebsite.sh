#!/bin/bash

rsync -auvzP --delete ~/projects/sunzhe.info/public/ root@sunzhe.info:/var/www/sunzhe.info/
