#!/bin/bash

export COMPOSE_PROJECT_NAME=mongodbdocker
docker-compose down
rm -f ./mongodb.key
