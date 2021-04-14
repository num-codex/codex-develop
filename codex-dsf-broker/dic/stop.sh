#!/usr/bin/env bash

# Arguments
#   1: docker-compose project token

cd dic
docker-compose -p $1 stop
