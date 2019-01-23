#!/bin/bash
  
if [[ $1 == "" ]]; then
    echo "Description: Shodan scanner with random delay."
    echo "Usage: $0 [ip list]"
    exit 1;
fi

IP_LIST=$1

for ip in $(cat $IP_LIST);
    do sleep $[($RANDOM%5)+1]
    shodan host $ip
done
