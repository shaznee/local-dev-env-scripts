#!/usr/bin/env bash

# This scripts creates a fresh container everytime the script runs
set +x

docker kill local-postgres
docker rm local-postgres

docker run -p 5432:5432 --name local-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres:alpine

docker cp sql/initialize-db.sql local-postgres:initialize-db.sql
echo "Waiting for psql to start..."
sleep 5
docker exec -it -d local-postgres psql postgres postgres -f initialize-db.sql

#docker exec -it local-postgres psql postgres postgres
