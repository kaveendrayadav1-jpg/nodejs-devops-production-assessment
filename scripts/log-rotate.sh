#!/bin/bash

LOG_DIR="/var/log/nodeapp"
ARCHIVE_DIR="/var/log/archive"
DATE=$(date +%F)

mkdir -p $ARCHIVE_DIR

find $LOG_DIR -type f -name "*.log" -size +10M | while read FILE
 do
   gzip "$FILE"
   mv "$FILE.gz" "$ARCHIVE_DIR/$(basename $FILE)-$DATE.gz"
 done

find $ARCHIVE_DIR -type f -mtime +30 -delete

echo "Log rotation completed"
