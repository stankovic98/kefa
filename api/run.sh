#!/usr/bin/env bash

# build binaries
GOOS=linux go build -o kefa || exit

sudo docker system prune -f --volumes

sudo docker-compose up --build -d

# clean up
rm kefa