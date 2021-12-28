#!/bin/bash

for filename in iptablesTelegramNotificationBot.py iptablesTelegramNotificationBot.sh iptablesTelegramNotificationToken.conf lastiptableslog myserviceslist venv
do
	sudo rm -r /etc/iptablesTelegramNotificationBot/$filename
done

sudo rm /etc/rsyslog.d/iptablesTelegramNotificationLog.conf
sudo /etc/init.d/rsyslog restart

if [ "`ls /etc/iptablesTelegramNotificationBot`" = "" ]
then
	rm -r /etc/iptablesTelegramNotificationBot
fi

