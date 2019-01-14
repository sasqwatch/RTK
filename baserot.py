#!/usr/bin/env python
# This script takes a message as input, base64 encodes it, and applies ROT13. Encoder/Decoder.
# Author: (@0rbz_)
# Usage: python baserot.py

import re
import sys
import base64
import string
import os

class x:
    r = '\033[91m'
    b = '\033[0m'


print x.r + '''
 ______ _____ _____ _____ _____ _____ ______
 | __  |  _  |   __|   __| __  |     |_   _|
 | __ -|     |__   |   __|    -|  |  | | |
 |_____|__|__|_____|_____|__|__|_____| |_| V.1.2
  by @0rbz_
'''

print x.b + "Would you like to Encode[1] or Decode[2]?"

opt = raw_input(">> ")

if opt == "1":
    msg_encode = raw_input("Enter some text you'd like to obscure> " + x.r) + x.b
    base_encode = base64.b64encode(msg_encode)
    rot = string.maketrans("ABCDEFGHIJKLMabcdefghijklmNOPQRSTUVWXYZnopqrstuvwxyz",
                           "NOPQRSTUVWXYZnopqrstuvwxyzABCDEFGHIJKLMabcdefghijklm")

    print x.b + "[BASEROT] ==> " + x.r + str.translate(base_encode, rot) + x.b

else:
    if opt == "2":
        msg = raw_input("Enter a BASEROT string to decode> " + x.r) + x.b
        rot = string.maketrans("ABCDEFGHIJKLMabcdefghijklmNOPQRSTUVWXYZnopqrstuvwxyz",
                               "NOPQRSTUVWXYZnopqrstuvwxyzABCDEFGHIJKLMabcdefghijklm")
        transpose = str.translate(msg, rot)
        saveme = sys.stdout
        memorylane = open('baserot', 'w')
        sys.stdout = memorylane
        print transpose
        sys.stdout = saveme
        memorylane = open('baserot', 'r')
        # incorrect padding fixup
        for line in memorylane:
            if len(line) % 4 !=0:
                while len(line) % 4 !=0:
                    line = line + "="
                b_str = base64.b64decode(line)
            else:
                b_str = base64.b64decode(line)
    print x.b + "[MESSAGE DECODED] ====>  " + x.r + base64.b64decode(line) + x.b
    os.remove("baserot")
