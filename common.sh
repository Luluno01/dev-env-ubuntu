#!/bin/bash

SERVICE_NAME=dev
IMAGE_NAME=$(basename $PWD)_${SERVICE_NAME}
CONTAINER_NAME=${IMAGE_NAME}_1

getImageId() {
  echo $(docker images | grep $IMAGE_NAME | awk -F ' ' '{print $3}')
}
