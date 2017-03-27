#!/bin/bash

docker-compose up -d 

## Config servers setup
docker cp mongo-configserver.init.js mongodbdocker_mongo-configserver-01_1:/
docker exec -it mongodbdocker_mongo-configserver-01_1 sh -c "mongo --port 27017 < /mongo-configserver.init.js"

## Shard servers setup
docker cp mongo-shard-01.init.js mongodbdocker_mongo-shard-01a_1:/
docker exec -it mongodbdocker_mongo-shard-01a_1 sh -c "mongo --port 27018 < /mongo-shard-01.init.js" 

docker cp mongo-shard-02.init.js mongodbdocker_mongo-shard-02a_1:/
docker exec -it mongodbdocker_mongo-shard-02a_1 sh -c "mongo --port 27019 < /mongo-shard-02.init.js"

docker cp mongo-shard-03.init.js mongodbdocker_mongo-shard-03a_1:/
docker exec -it mongodbdocker_mongo-shard-03a_1 sh -c "mongo --port 27020 < /mongo-shard-03.init.js"

## Apply sharding configuration
sleep 15
docker cp mongo-sharding.init.js mongodbdocker_mongo-router-01_1:/
docker exec -it mongodbdocker_mongo-router-01_1 sh -c "mongo --port 27017 < /mongo-sharding.init.js"
