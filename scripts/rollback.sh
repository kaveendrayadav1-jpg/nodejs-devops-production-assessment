#!/bin/bash

set -e

APP_NAME="nodejs-app"
PREVIOUS_TAG=$1
CONTAINER_NAME="nodejs-container"

if [ -z "$PREVIOUS_TAG" ]; then
  echo "Previous image tag required"
  exit 1
fi

echo "Rolling back application..."

docker stop $CONTAINER_NAME || true

docker rm $CONTAINER_NAME || true

docker run -d \
  --name $CONTAINER_NAME \
  -p 3000:3000 \
  myrepo/$APP_NAME:$PREVIOUS_TAG

echo "Rollback completed"
