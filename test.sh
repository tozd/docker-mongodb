#!/bin/sh

set -e

cleanup() {
  set +e

  echo "Logs"
  docker logs test

  echo "Stopping Docker image"
  docker stop test
  docker rm -f test
}

echo "Running Docker image"
docker run -d --name test -e LOG_TO_STDOUT=1 -p 27017:27017 "${CI_REGISTRY_IMAGE}:${TAG}"
trap cleanup EXIT

echo "Sleeping"
sleep 10

echo "Testing"
nc -z docker 27017
