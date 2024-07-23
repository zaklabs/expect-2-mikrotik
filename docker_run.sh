#!/bin/bash

export JOB_NAME="ubuntu_expect18"
export IMAGE="ubuntu1804/expect"
export TAG="latest"
export LOG_FOLDER=./data
export RUNTIME=""

echo ${IMAGE}:${TAG}

# Create log folder if not exists
if [ ! -d ${LOG_FOLDER} ]; then
     mkdir ${LOG_FOLDER}
fi

# stop running container with same job name, if any
if [ "$(docker ps -a | grep $JOB_NAME)" ]; then
  docker stop ${JOB_NAME} && docker rm ${JOB_NAME}
fi

docker run -d \
  --rm -it \
  ${RUNTIME} \
  -v "${LOG_FOLDER}:/zone" \
  --name="${JOB_NAME}" \
  ${IMAGE}:${TAG} /bin/bash