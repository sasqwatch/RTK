#!/usr/bin/env python

# Check logs for presence of alleged "Grizzly Steppe" IP Addresses.

# Usage: python grizzly.py [log file]
# Will download the grizzly-ips.txt file from github if not present.
# Author: (@0rbz_)

import os
import requests
import time
import sys

class color:
    g = '\033[92m'
    r = '\033[91m'
    b = '\033[0m'

if len(sys.argv) != 2:
    print 'Usage: python %s [log file]' % sys.argv[0]
    exit()

log = sys.argv[1]
logx = open(log)
# Modify this to point to any other IOC IP list if you so desire.
grizzly_ips = "https://gist.githubusercontent.com/achillean/89c6f96ed4719abd02ecaac9c3d1148d/raw/7e129ed1e107c1003a3fdbedbededd0c93c3a73b/grizzly-ips.txt"
ip_list = "grizzly-ips.txt"

if os.path.isfile(ip_list):

    f = open(ip_list, "rb")
    search = f.readlines()
    f.close()

    print "\nSearching " + log + " for Grizzly Steppe IOC IP's..."
    time.sleep(3)
    print "\nThe following IP's were found in " + log + ":"

    for line in logx.readlines():
        for ip in open(ip_list).read().splitlines():
            if ip in line:

                print "\nFound IP: " + color.r + ip + color.b
                print "In line [" + log + "]:"
                print color.g + line + color.b
else:

    with open(ip_list, "wb") as f:

        ua = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1'}
        response = requests.get(grizzly_ips, stream=True, headers=ua)
        f.write(response.content)

    f = open(ip_list, "rb")
    search = f.readlines()
    f.close()

    print "\nSearching " + log + " for Grizzly Steppe IOC IP's..."
    time.sleep(3)
    print "\nThe following IP's were found in " + log + ":"

for line in logx.readlines():
    for ip in open(ip_list).read().splitlines():
        if ip in line:

            print "\nFound IP: " + color.r + ip + color.b
            print "In line [" + log + "]:"
            print color.g + line + color.b
