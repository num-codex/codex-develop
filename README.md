# Codex Development Repository

This repository allows a developer to start a development environment, which contains all elements off the CODEX AP1.7, AP2.2 and AP2.3

![Num-Codex AP1.7,AP2.2, AP2.3 Overview](img/codex-ap2-overview.png)

## How to use

Execute the `gitUpdate.sh` to pull all the repositories of the codex project into the current folder.

Depending on which parts you would like to develop yourself and which parts you would like to use as given you can start up components as docker containers or run the development for each component yourself.

Note that you will have to run all components which are supposed to be able to communicate with each other inside the same docker network.
To ensure that this is the case, start the respective components in their docker containers within the same docker network or expose the containers to localhost 
to make them available to components not started inside a docker container.




## Example setup for project


```bash
export COMPOSE_PROJECT=codex-develop

cd codex-keycloak
docker-compose -p $COMPOSE_PROJECT up -d

cd ../codex-feasibility-backend
docker-compose -p $COMPOSE_PROJECT up -d

cd ../codex-flare
docker-compose -p $COMPOSE_PROJECT up -d

cd ../num-knoten/fhir-server/blaze-server
docker-compose -p $COMPOSE_PROJECT up -d


```