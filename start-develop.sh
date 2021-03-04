#!/bin/sh

export COMPOSE_PROJECT=codex-develop

cd codex-keycloak
docker-compose -p $COMPOSE_PROJECT up -d

cd ../codex-feasibility-gui
docker-compose -p $COMPOSE_PROJECT up -d

cd ../codex-feasibility-backend
docker-compose -p $COMPOSE_PROJECT up -d

cd ../num-knoten/fhir-server/blaze-server
docker-compose -p $COMPOSE_PROJECT up -d