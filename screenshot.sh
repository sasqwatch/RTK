#!/bin/bash

if [[ $1 == "" ]]; then
    echo "Usage: $0 [hosts.txt]"
    echo "Example: $0 hosts.txt"
    exit 1;
fi

HOSTFILE=$1
HOSTS=$(cat $HOSTFILE)
WGET=$(which wget)
UA="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:64.0) Gecko/20100101 Firefox/64.0"

for host in $HOSTS; do

    $WGET --user-agent="$UA" https://screenshot-v2.now.sh/http://$host?fullPage=True -O $host.png; 

done
