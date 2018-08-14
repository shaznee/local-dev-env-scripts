#!/usr/bin/env bash

set +x

docker kill local-redis
docker rm local-redis

docker run -d --name local-redis -p 6379:6379 redis:alpine