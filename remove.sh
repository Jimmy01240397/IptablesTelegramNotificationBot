#!/bin/bash

for filename in iptablesTelegramNotificationBot.sh iptablesTelegramNotificationToken.conf userid.conf lastiptableslog myserviceslist
do
	sudo rm -r /etc/iptablesTelegramNotificationBot/$filename
done

sudo rm /etc/rsyslog.d/iptablesTelegramNotificationLog.conf
sudo /etc/init.d/rsyslog restart

if [ "`ls /etc/iptablesTelegramNotificationBot`" = "" ]
then
	rm -r /etc/iptablesTelegramNotificationBot
fi

echo ""
echo ""
echo "Iptables Telegram Notification Bot remove.sh complete."
