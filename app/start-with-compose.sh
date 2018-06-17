#!/bin/bash -x
source environment

./create-configs.sh

docker-compose up --detach --remove-orphans --build --force-recreate

waitFor 127.0.0.1 9200
waitFor 127.0.0.1 9300
waitFor 127.0.0.1 5000
waitFor 127.0.0.1 4560
waitFor 127.0.0.1 9290

sleep 5
docker ps

echo "Init default index..."
./init-index.sh
