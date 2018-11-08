#!/usr/bin/env bash

# This scripts creates a fresh container everytime the script runs
set +x

docker kill local-jenkins
docker rm local-jenkins

docker run --name local-jenkins -d -i \
-p 8080:8080 -p 50000:50000 --rm -u root \
-v $(which docker):/usr/bin/docker \
-v /var/run/docker.sock:/var/run/docker.sock \
-v ~/jenkins_home:/var/jenkins_home \
jenkins

# Run the following command after the container starts to retieve the admin password
# docker exec -it local-jenkins cat /var/jenkins_home/secrets/initialAdminPassword