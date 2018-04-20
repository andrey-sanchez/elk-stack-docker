#!/bin/bash
./scripts/env-configs.sh
./scripts/create-configs.sh
docker-compose up --build #-d 
