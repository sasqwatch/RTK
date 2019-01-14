#!/bin/bash

cat << "EOF"
   _   _   _   _   _   _   _  
  / \ / \ / \ / \ / \ / \ / \ 
 ( W | E | B | L | I | N | X )
  \_/ \_/ \_/ \_/ \_/ \_/ \_/ 

EOF

CYAN='\033[0;36m'
NC='\033[0m'

if [[ $1 == "" ]]; then
    echo "Usage: $0 http://site";
    exit 1;
fi

CURL=$(which curl)
URL=$1
UA="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:64.0) Gecko/20100101 Firefox/64.0"

printf "Results from ${CYAN}$URL${NC}:\n"
$CURL -s -H "$UA" -L $URL | grep -Eo "(http|https|ftp|file|ws)://[a-zA-Z0-9./?=_-]*" | sort | uniq
