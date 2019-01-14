#!/bin/bash
# apt install xmlstarlet

if [[ $1 == "" ]]; then
    echo "Description: Pulls all IP's from an Nmap XML file for a specific service type."
    echo "Usage: $0 [xml file] [service type]"
    echo "Example: $0 allhosts.xml https"
    exit 1;
fi

XMLFILE=$1
SVCNAME=$2

xmlstarlet sel -t -m "//port[@protocol='tcp' and service/@name='$SVCNAME' and state/@state='open']/ancestor::host/address[@addrtype='ipv4']" -v '@addr' -n $XMLFILE
