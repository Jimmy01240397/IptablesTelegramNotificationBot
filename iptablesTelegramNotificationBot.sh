#!/bin/bash

cd /etc/iptablesTelegramNotificationBot
. ./venv/bin/activate
echo "$1"
python3 iptablesTelegramNotificationBot.py "$1"
