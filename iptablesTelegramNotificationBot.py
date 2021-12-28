from telegram.ext import Updater 
from telegram.ext import CommandHandler, CallbackQueryHandler 
from telegram.ext import MessageHandler, Filters 
from telegram import InlineKeyboardMarkup, InlineKeyboardButton 
import re
import sys
import time
import socket

with open('iptablesTelegramNotificationToken.conf', 'r') as f:
    token = f.read()

updater = Updater(token=token, use_context=False)
dispatcher = updater.dispatcher

src = re.findall("SRC=(\\d+(\\.\\d+){3})", sys.argv[1])[0][0]
pro = re.findall("PROTO=(TCP|UDP)", sys.argv[1])[0]
port = re.findall("DPT=(\\d+)", sys.argv[1])[0]
nowtime = time.time()
with open("lastiptableslog", 'r') as f:
    lastlog = f.read()

if lastlog == '':
    bfsrc = '0'
    bfpro = '0'
    bfport = '0'
    bftime = '0'
else:
    bfsrc = re.findall("SRC=(\\d+(\\.\\d+){3})", lastlog)[0][0]
    bfpro = re.findall("PROTO=(TCP|UDP)", lastlog)[0]
    bfport = re.findall("DPT=(\\d+)", lastlog)[0]
    bftime = float(re.findall("TIME=(\\d+(\\.\\d+)?)", lastlog)[0][0])

if bfsrc != src || bfpro != pro || bfport != port || (nowtime - bftime) > 60:
    with open('myserviceslist', 'r') as f:
        service = re.findall("(?i)(^|\n)(\S*)\s*445/tcp", f.read())
    if len(service) == 0:
        service = port + "/" + pro + " port"
    else:
        service = service[0][1] + "(" + port + "/" + pro + ") service"

    dispatcher.bot.send_message(chat_id='1260298751', text=socket.gethostname() + ": The " + service + " has been ACCEPT from ip=" + src)
    with open("lastiptableslog", 'w') as f:
         f.write("TIME=$nowtime " + sys.argv[1])
