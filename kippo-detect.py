#!/usr/bin/env python
# kippo-detect.py
# fingerprint Kippo SSH instances
# detects "bad packet length" fingerprint in packet response
# author: (@0rbz_)
# context: https://www.obscurechannel.com/x42/magicknumber.html

'''
USAGE: python kippo-detect.py [ip] [port]
'''

import socket
import sys

class x:
    r = '\033[91m'
    b = '\033[0m'
    g = '\033[92m'

target_ip = sys.argv[1]
target_port = sys.argv[2]

s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect((target_ip,int(target_port)))
send_data = "\n\n\n\n\n\n\n\n"
s.send(send_data)

response = s.recv(1024)

if "bad packet length" in response:
    print x.r + "\n\n" + "*** KIPPO HONEYPOT DETECTED ON " + target_ip + " ***" +  "\n\n" + x.b + "RESPONSE:" + "\n" + response + "\n" + ""

if "bad packet length" not in response:
    print x.g + "\n\n" + "KIPPO HONEYPOT NOT DETECTED ON " + target_ip + "\n\n" + x.b + "RESPONSE:" + "\n" + response + ""

s.close()
