# iptablesTelegramNotificationBot
It is a iptables Telegram Notification Bot make by Debian 11. 

## Demo
![image](https://user-images.githubusercontent.com/57281249/147621267-a85a9883-0e18-4e89-80b7-9c3e97746e30.png)

## Install

1. clone this repo and cd into iptablesTelegramNotificationBot.

```bash
git clone https://github.com/Jimmy01240397/iptablesTelegramNotificationBot
cd iptablesTelegramNotificationBot
```

2. run install.sh

```bash
sh install.sh
```

3. config your Telegram bot token in iptablesTelegramNotificationToken.conf
```bash
vi /etc/IptablesTelegramNotificationBot/iptablesTelegramNotificationToken.conf

12345:AAAAAAAAAAAAAAAA
```

4. config your iptables log prefix in iptablesTelegramNotificationLog.conf
```
vi /etc/rsyslog.d/iptablesTelegramNotificationLog.conf

#################################################
####  iptables Telegram Notification log     ####
#################################################

if $msg contains "<YOUR IPTABLES LOG PREFIX>" then {
	^/etc/iptablesTelegramNotificationBot/iptablesTelegramNotificationBot.sh
	stop
}
```

## Remove
cd into this repo iptablesTelegramNotificationBot and run remove.sh.
```bash
cd iptablesTelegramNotificationBot
sh remove.sh
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
