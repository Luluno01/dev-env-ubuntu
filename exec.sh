#!/bin/bash

# Execute command in the container

source common.sh
docker exec -u $UID -it $CONTAINER_NAME "$@"
