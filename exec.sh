#!/bin/bash

# Execute command in the container

CONTAINER_NAME=$(basename $PWD)_dev_1
docker exec -u $UID -it $CONTAINER_NAME "$@"
