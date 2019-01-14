#!/bin/bash
  
if [[ $1 == "" ]]; then
        echo "$0 [userlist.txt] [ip]";
        exit 1;
fi

RPCCLIENT=$(which rpcclient)
USERLIST=$1
IP=$2

for u in $(cat $USERLIST); do $RPCCLIENT -U "" $IP -N --command="lookupnames $u"; done |grep "User: 1"
