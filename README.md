# Codex Development Repository

This repository allows a developer to start a development environment, which contains all elements off the CODEX AP1.7, AP2.2 and AP2.3

## Codex Feasibility Query Overview

The Figure 1 below provides an overview of the whole system neccessary to create a feasibility query at a central location, execute the query dezentralised accross multiple sites and recieve confuscated feasibility responses.

<figure class="image">
  <img src="img/codex-ap2-overview.png">
  <figcaption>Figure 1 - Overview Codex AP2 - Feasibility Queries</figcaption>
</figure>

## How to use

Execute the `gitUpdate.sh` to pull all the repositories of the codex project into the current folder.

Depending on which parts you would like to develop yourself and which parts you would like to use as given you can start up components as docker containers or run the development for each component yourself.

Note that you will have to run all components which are supposed to be able to communicate with each other inside the same docker network.
To ensure that this is the case, start the respective components in their docker containers within the same docker network or expose the containers to localhost 
to make them available to components not started inside a docker container.


## Initialise the project

The project in develop mode requires one to set up the development environments for some of the components or at least build the packages from the source code. In some cases the source code does not need to be compiled (e.g. flare (python project)).

1. codex-feasibility-backend

Follow the instructions of the codex-feasibility-backend [README](codex-feasibility-backend/README.md) > Setting up Development - Steps 1 and 2
Note: Requires Java 15 and maven

2. codex-sq2cql

The codex-sq2cql library is used by the codex-feasibility-backend to translate the structured query to cql.
You can change the codex-sq2cql version used in the backend either by changing the dependency in the backend pom to one of the realeases here https://github.com/num-codex/codex-sq2cql/packages or by building it locally and adding the dependency manually to the backend.


## Example setup for project

To start an example setup with docker containers use the `start-develop.sh` script, which allows you to start the respective docker containers for the components you would like to set up locally.

In the standard setup, the develop script will start: codex-keycloak,codex-feasibility-gui,codex-feasibility-backend,codex-flare

If you would like to start a different combination of components set the environment variable `CODEX_REPOS` accordingly.
The variable `CODEX_REPOS` variable accepts a comma separated list of components repository names you would like to start locally.

