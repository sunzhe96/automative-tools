#!/bin/bash

# disable laptop's builtin keyboard
xinput | grep AT | awk -F "=" {'print $2'} | awk {'print $1'} | xargs xinput disable

