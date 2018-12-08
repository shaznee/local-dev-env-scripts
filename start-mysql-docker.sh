#!/usr/bin/env bash

# This scripts creates a fresh container everytime the script runs
set +x

docker kill local-mysql
docker rm local-mysql

docker run -p 3306:3306 --name local-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql --default-authentication-plugin=mysql_native_password #:alpine

docker cp sql/initialize-db.sql local-mysql:initialize-db.sql
echo "Waiting for mysql to start..."
sleep 5

#mysql -u root -pmysecretpassword < initialize-db.sql

