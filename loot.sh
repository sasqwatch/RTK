#!/bin/bash

if [[ $1 == "" ]]; then
    echo "./loot.sh [IP address]";
    exit 1;
fi

IP=$1

ls -als ~/.msf4/loot/ |grep "$IP" | awk -v msfdir="/$USER/.msf4/loot" '{print msfdir"/"$10}'
