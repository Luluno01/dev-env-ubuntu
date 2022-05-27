#!/bin/bash
# Build the image

TZ=$(cat /etc/timezone)
USER=$(whoami)
UID=$(id -u)
GID=$(id -g)
echo Building the image with TZ=$TZ user=$USER uid=$UID gid=$GID
PRIV=false docker-compose build \
  --build-arg TZ=$TZ \
  --build-arg user=$USER \
  --build-arg uid=$UID \
  --build-arg gid=$GID
