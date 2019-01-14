#!/bin/bash

if [[ $1 == "" ]]; then
  echo "Bash/Netcat HTTP Server"
  echo "Usage: ./http.sh [port]"
  exit 1;
fi

BINDPORT=$1
NC=$(which nc)

:;while [ $? -eq 0 ];do $NC -vlp $BINDPORT -c'(r=read;e=echo;$r a b c;z=$r;while [ ${#z} -gt 2 ];do $r z;done;f=`$e $b|sed 's/[^a-z0-9_.-]//gi'`;h="HTTP/1.0";o="$h 200 OK\r\n";c="Content";if [ -z $f ];then($e $o;ls|(while $r n;do if [ -f "$n" ]; then $e "`ls -gh $n`";fi;done););elif [ -f $f ];then $e "$o$c-Type: `file -ib $f`\n$c-Length: `stat -c%s $f`";$e;cat $f;else $e -e "$h 404 Not Found\n\n404\n";fi)';done
