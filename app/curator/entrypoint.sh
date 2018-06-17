#!/bin/bash -x
echo "Starting cron"
cron
sleep 2
tail -f /curator/log.log
