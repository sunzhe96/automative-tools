#!/bin/bash

year=$(date +%Y)
month=$(date +%Y-%m)
date=$(date +%F)

function create_date() {
    mkdir -v "$year/$month/$date"
}

function create_month_date() {
    mkdir -v "$year/$month" && mkdir -v "$year/$month/$date"
}

function create_full_path() {
    mkdir -v "$year" && mkdir -v "$year/$month/" && mkdir -v "$year/$month/$date"
}


if [[ -d "$year" ]]
then
   if [[ -d "$year/$month" ]]
   then
       if [[ ! -d "$year/$month/$date" ]]
       then
	   create_date
       fi
   else
       create_month_date
   fi
else
    create_full_path
fi

mv -v *.flac "$year/$month/$date/"
echo "Finished"
