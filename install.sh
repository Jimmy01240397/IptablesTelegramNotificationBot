#!/bin/bash

set -e

set +e
sudo mkdir /etc/iptablesTelegramNotificationBot 2> /dev/null
set -e

for filename in iptablesTelegramNotificationBot.sh iptablesTelegramNotificationToken.conf userid.conf lastiptableslog
do
	sudo cp -r $filename /etc/iptablesTelegramNotificationBot/
done

for filename in iptablesTelegramNotificationBot.sh
do
	sudo chmod +x /etc/iptablesTelegramNotificationBot/$filename
done

sudo cp /etc/services /etc/iptablesTelegramNotificationBot/myserviceslist
sudo cp iptablesTelegramNotificationLog.conf /etc/rsyslog.d/iptablesTelegramNotificationLog.conf
sudo /etc/init.d/rsyslog restart

echo ""
echo ""
echo "Iptables Telegram Notification Bot install.sh complete."
echo "Please config your bot token in /etc/iptablesTelegramNotificationBot/iptablesTelegramNotificationToken.conf and userid in /etc/iptablesTelegramNotificationBot/userid.conf"
echo "If you want to change your iptables log prefix for notification. Please config your /etc/rsyslog.d/iptablesTelegramNotificationLog.conf"
