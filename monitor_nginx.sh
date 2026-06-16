#!/bin/bash

BOT_TOKEN=
CHAT_ID=

if ! systemctl is-active --quiet nginx
then
    echo "$(date) - Service was down, restarting" >> /var/log/my_monitor.log

    systemctl restart nginx
    echo "https://api.telegram.org/bot$BOT_TOKEN/sendMessage"   

    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
    -d "chat_id=$CHAT_ID" \
    -d "text=nginx restarted on Linux Test Lab"
fi
