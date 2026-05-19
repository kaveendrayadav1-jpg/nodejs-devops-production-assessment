#!/bin/bash

URL="http://localhost:3000/health"
LOG_FILE="/var/log/health-check.log"

STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)

if [ "$STATUS" -eq 200 ]; then
  echo "[$(date)] Application healthy" >> $LOG_FILE
  exit 0
else
  echo "[$(date)] Application unhealthy" >> $LOG_FILE
  exit 1
fi
