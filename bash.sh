#!/bin/bash

# Start /bin/bash in the container

source common.sh
docker exec -u $UID -it $CONTAINER_NAME /bin/bash "$@"
