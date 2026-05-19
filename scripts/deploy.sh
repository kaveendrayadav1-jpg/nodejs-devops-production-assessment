#!/bin/bash

set -e

APP_NAME="nodejs-app"
IMAGE_TAG=$1
CONTAINER_NAME="nodejs-container"
PORT=3000
LOG_FILE="/var/log/deploy.log"

log() {
  echo "[$(date)] $1" | tee -a $LOG_FILE
}

log "Starting deployment..."

if [ -z "$IMAGE_TAG" ]; then
  log "ERROR: Image tag not provided"
  exit 1
fi

log "Pulling latest image"
docker pull myrepo/$APP_NAME:$IMAGE_TAG

log "Stopping existing container"
docker stop $CONTAINER_NAME || true

docker rm $CONTAINER_NAME || true

log "Starting new container"
docker run -d \
  --name $CONTAINER_NAME \
  -p $PORT:3000 \
  myrepo/$APP_NAME:$IMAGE_TAG

sleep 10

STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" http://localhost:$PORT/health)

if [ "$STATUS" -ne 200 ]; then
  log "Health check failed"
  exit 1
fi

log "Deployment successful"
