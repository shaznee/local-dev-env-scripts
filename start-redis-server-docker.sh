#!/usr/bin/env bash

# This scripts creates a fresh container everytime the script runs
set +x

docker kill local-redis
docker rm local-redis

docker run -d --name local-redis -p 6379:6379 redis:alpine