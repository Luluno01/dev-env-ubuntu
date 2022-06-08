#!/bin/bash
# Build the image

source common.sh

OLD_IMAGE_ID=''
while getopts 'r' o; do
  case "${o}" in
    r)
      OLD_IMAGE_ID=$(getImageId)
      ;;
    *)
      echo Unrecognized option "${o}"
      exit 1
      ;;
  esac
done

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

buildRet=$?
if [ $buildRet -ne 0 ]; then
  exit $buildRet
fi

newImageId=$(getImageId)
if [ ! -z "$OLD_IMAGE_ID" ] && [ ! -z "$newImageId" ] && [ "$OLD_IMAGE_ID" != "$newImageId" ]; then
  echo Removing old image $OLD_IMAGE_ID
  docker rmi $OLD_IMAGE_ID
fi
