#!/bin/sh

export COMPOSE_PROJECT=codex-develop

CODEX_REPOS=${CODEX_REPOS:-"codex-keycloak,codex-feasibility-gui,codex-feasibility-backend,codex-flare"}

readlink "$0" > /dev/null
if [ $? -ne 0 ]; then
  baseDir=$(dirname "$0")
else
  baseDir=$(dirname "$(readlink "$0")")
fi


for repoName in ${CODEX_REPOS//,/ }
do
  curRepo="$baseDir/$repoName"
  if [ -d "$curRepo" ]
  then
        cd $curRepo
        if [ "$repoName" == "codex-processes-ap2" ]
          # add startup 
        then
          echo "codex-processes-ap2"
        elif [ "$repoName" == "codex-aktin-broker" ]
        then
          cd aktin-broker
          docker-compose -p $COMPOSE_PROJECT down
          sleep 10
          cd ../aktin-client
          docker-compose -p $COMPOSE_PROJECT down
        elif [ "$repoName" == "num-knoten" ]
        then
          cd fhir-server/blaze-server
          docker-compose -p $COMPOSE_PROJECT down
        else
          docker-compose -p $COMPOSE_PROJECT down
        fi
  fi
done
