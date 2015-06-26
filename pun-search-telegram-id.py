#!/bin/env python
#
# pun-search-telegram-id - Search you telegram user id
# part of: pun - Pacman Update Notifier
#
# v0.2 / 2015.06.26
#
# © 2015 Bernd Busse, Daniel Jankowski
# Licensed under the LGPLv3

import urllib.request
import json
import sys

TOKEN = "99568574:AAHlHk7dtIs8_xTIauY8qT_oocHjTgHsL3A"
UPDATE_URL = "https://api.telegram.org/bot" + TOKEN + "/getUpdates"

if len(sys.argv) < 2:
    print("Please specify a username to search for.", file=sys.stderr)
    sys.exit(1)

username = sys.argv[1]

request = urllib.request.urlopen(UPDATE_URL)
response = json.loads(request.read().decode("utf-8"))

for i in range(len(response['result'])):
    user = response['result'][i]['message']['chat']
    if username == user['username']:
        print(username + ": " + str(user['id']))
        sys.exit(0)

print("Cannot find user id for name '" + username + "'", file=sys.stderr)
sys.exit(1)
