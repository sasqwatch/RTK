#!/bin/bash

if [[ $1 == "" ]]; then
        echo "Usage: $0 [ips.txt]"
        exit 1;
fi

IPLIST=$1
NSLOOKUP=$(which nslookup)

for i in $(cat $IPLIST)
    do $NSLOOKUP $i | grep -i name | awk -v ip="$i" -F'=' '{print ip":"$NF}'
done
