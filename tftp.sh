#!/bin/bash

if [[ $1  == "" ]]; then
        echo "Usage: $0 [file_list.txt] [ip]";
        exit 1;
fi

filelist=$1
IP=$2

for line in $(cat $filelist)
do
        tftp $IP << EOF
        verbose
        binary
        get $line
EOF
done
#delete empty files when we're finished
#find . -type f -empty -delete
