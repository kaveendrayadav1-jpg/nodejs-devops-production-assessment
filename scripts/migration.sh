#!/bin/bash

set -e

echo "Running database migrations"

npm run migrate

if [ $? -eq 0 ]; then
  echo "Migration successful"
else
  echo "Migration failed"
  exit 1
fi
