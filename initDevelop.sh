#!/bin/bash

# this sets up the project
if [ ! "$(docker network ls | grep codex-develop)" ]; then
docker network create codex-develop
fi