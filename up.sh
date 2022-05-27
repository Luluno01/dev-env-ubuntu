#!/bin/bash

# Bring up the container

PRIV=${PRIV:-false}
if [ "$PRIV" == true ]; then
  echo Warning: starting the container in privileged mode
fi
PRIV=$PRIV docker-compose up -d
./exec.sh hostname -I > ip.txt
