#!/bin/bash -e

# An example script to run MongoDB in production. It uses data volumes under the $DATA_ROOT directory.
# By default /srv.

NAME='mongodb'
DATA_ROOT='/srv'
MONGODB_DATA="${DATA_ROOT}/${NAME}/data"
MONGODB_LOG="${DATA_ROOT}/${NAME}/log"

mkdir -p "$MONGODB_DATA"
mkdir -p "$MONGODB_LOG"

docker stop "${NAME}" || true
sleep 1
docker rm "${NAME}" || true
sleep 1
docker run --detach=true --restart=always --name "${NAME}" --volume "${MONGODB_LOG}:/var/log/mongod" --volume "${MONGODB_DATA}:/var/lib/mongodb" tozd/mongodb
