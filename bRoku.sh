#!/bin/bash
# Tested on a ROKU 2 - 2720x
# This will restart a ROKU assuming the navigation is the same for all models
# Example: ./bRoku.sh [Roku ip]
# Author: (@0rbz_)
# Context: https://www.obscurechannel.com/x42/restarting_the_roku.html

TARGET=$1
CURL=$(which curl)

if [[ $1 == "" ]];then
  echo "Usage: $0 [Roku ip]"
  exit 1;
fi

# Navigation below can be modified to suit your specific needs

$CURL -d '' http://$TARGET:8060/keypress/home
$CURL -d '' http://$TARGET:8060/keypress/up
$CURL -d '' http://$TARGET:8060/keypress/right
$CURL -d '' http://$TARGET:8060/keypress/up
$CURL -d '' http://$TARGET:8060/keypress/right
$CURL -d '' http://$TARGET:8060/keypress/down
$CURL -d '' http://$TARGET:8060/keypress/down
$CURL -d '' http://$TARGET:8060/keypress/down
$CURL -d '' http://$TARGET:8060/keypress/down
$CURL -d '' http://$TARGET:8060/keypress/right
$CURL -d '' http://$TARGET:8060/keypress/select