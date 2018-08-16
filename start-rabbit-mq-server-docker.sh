#!/usr/bin/env bash

set +x

docker kill local-rabbit-mq
docker rm local-rabbit-mq

# Create a RabbitMQ Server container locally with RabbitMQ management console enabled
# default username = admin / password = password
docker run -d --hostname rabbit-mq-server --name local-rabbit-mq \
-e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=password \
-p 4369:4369 -p 5671:5671 -p 5672:5672 -p 15672:15672 \
rabbitmq:management-alpine

# Create your own administrator account on RabbitMQ server
# username = admin / password = myAdminPassword
#docker exec local-rabbit-mq rabbitmqctl add_user admin myAdminPassword
#docker exec local-rabbit-mq rabbitmqctl set_user_tags admin administrator
#docker exec local-rabbit-mq rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"

# Enable RabbitMQ management console
#docker exec local-rabbit-mq rabbitmq-plugins enable rabbitmq_management
#docker exec local-rabbit-mq chown -R root:root /var/lib/rabbitmq/

# Setup an administrator user account for accessing the RabbitMQ server management console
# RabbitMQ management console username = mqadmin / password = mqAdminPassword
#docker exec local-rabbit-mq rabbitmqctl add_user mqadmin mqAdminPassword
#docker exec local-rabbit-mq rabbitmqctl set_user_tags mqadmin administrator
#docker exec local-rabbit-mq rabbitmqctl set_permissions -p / mqadmin ".*" ".*" ".*"