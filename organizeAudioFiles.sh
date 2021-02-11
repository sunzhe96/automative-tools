#!/bin/bash

year=$(date +%Y)
month=$(date +%Y-%m)
date=$(date +%F)

function create_date() {
    mkdir -v "$HOME/Audio/$year/$month/$date"
}

function create_month_date() {
    mkdir -v "$HOME/Audio/$year/$month" && mkdir -v "$HOME/Audio/$year/$month/$date"
}

function create_full_path() {
    mkdir -v "$HOME/Audio/$year" && mkdir -v "$HOME/Audio/$year/$month/" && mkdir -v "$HOME/Audio/$year/$month/$date"
}


if [[ -d "$HOME/Audio/$year" ]]
then
   if [[ -d "$HOME/Audio/$year/$month" ]]
   then
       if [[ ! -d "$HOME/Audio/$year/$month/$date" ]]
       then
	   create_date
       fi
   else
       create_month_date
   fi
else
    create_full_path
fi

mv -v ~/Audio/*.flac "$HOME/Audio/$year/$month/$date/"
echo "Finished"
