#!/bin/bash

head=$"https://s.weibo.com/"
resou=$"https://s.weibo.com/top/summary?cate=realtimehot"

curl -o resou.html "$resou"

grep href=\"/weibo resou.html | awk -F ">" '{ print NR " " $2 }' | sed 's/<*\/a//' > topics
grep href=\"/weibo resou.html | awk -F " " '{ print $2 }' | awk -v head="$head" -F "\"" '{ print head $2 }' > links
cat topics

read -p "Enter topics number [q to quit]: " answer

case "$answer" in
    [1-50]*) topic_chose=$(paste topics links | awk -v line="$answer" 'FNR == line { print $3 }');;
    *) rm topics links resou.html && exit 0;;
    # *) topic_chose=$(paste topics links | awk -v line="$answer" 'FNR == line { print $3 }');;
esac

firefox "$topic_chose"
rm topics links resou.html

