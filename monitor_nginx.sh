#!/bin/bash

if ! systemctl is-active --quiet nginx
then
    echo "$(date) - Service was down, restarting" >> /var/log/my_monitor.log
    sudo systemctl restart nginx
fi
