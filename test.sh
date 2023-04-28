#!/bin/sh

set -e

cleanup() {
  echo "Stopping Docker image"
  docker stop test
}

echo "Preparing"
apk add --no-cache nc

echo "Running Docker image"
docker run -d --name test --rm -p 27017:27017 "${CI_REGISTRY_IMAGE}:${TAG}"
trap cleanup EXIT

echo "Sleeping"
sleep 10

echo "Testing"
nc -z localhost 27017