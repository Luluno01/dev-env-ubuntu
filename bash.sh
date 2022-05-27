#!/bin/bash

# Start /bin/bash in the container

CONTAINER_NAME=$(basename $PWD)_dev_1
docker exec -u $UID -it $CONTAINER_NAME /bin/bash "$@"
