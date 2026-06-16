#!/bin/bash

PROCESS_NAME="sleep"

if pgrep "$PROCESS_NAME" > /dev/null
then
    echo "$PROCESS_NAME is running"
else
    echo "$PROCESS_NAME is NOT running"
fi
