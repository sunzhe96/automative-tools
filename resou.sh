#!/bin/bash

head=$"https://s.weibo.com/"
resou=$"https://s.weibo.com/top/summary?cate=realtimehot"

curl -o resou.html "$resou"

grep href=\"/weibo resou.html | awk -F ">" '{ print NR " " $2 }' | sed 's/<*\/a//' > topics
grep href=\"/weibo resou.html | awk -F " " '{ print $2 }' | awk -v head="$head" -F "\"" '{ print head $2 }' > links
cat topics

read -p "Enter topic number [any letter to quit]: " answer

if [[ "${answer}" =~ ^[1-9]$|^[1-4][0-9]$|^5[0-1]$ ]]
then
    topic_chose=$(paste topics links | awk -v line="$answer" 'FNR == line { print $3 }')
else
    rm topics links resou.html && exit 0
fi

firefox "$topic_chose"    
rm topics links resou.html

