#!/bin/bash

if [[ $1 == "" ]]; then
    echo "Description: Netcat port scanner with random delay."
    echo "Usage: $0 [ip] [start port] [end port]"
    exit 1;
fi

NC=$(which nc)
IP=$1
STARTPORT=$2
ENDPORT=$3

for p in $(seq $STARTPORT $ENDPORT)
    do sleep $[($RANDOM%5)+1]
    $NC -v -n -z $IP $p
done
