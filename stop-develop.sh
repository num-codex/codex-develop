#!/bin/sh

export COMPOSE_PROJECT=codex-develop

CODEX_REPOS=${CODEX_REPOS:-"codex-keycloak,codex-feasibility-gui,codex-feasibility-backend,codex-flare"}
baseDir=$(pwd)


for repoName in ${CODEX_REPOS//,/ }
do
  curRepo="$baseDir/$repoName"
  if [ -d "$curRepo" ]
  then
        cd $curRepo
        if [ "$repoName" == "codex-dsf-broker" ]
        then
          ./zars/stop.sh $COMPOSE_PROJECT
          ./dic/stop.sh $COMPOSE_PROJECT
        elif [ "$repoName" == "codex-aktin-broker" ]
        then
          cd aktin-broker
          docker-compose -p $COMPOSE_PROJECT stop
          sleep 10
          cd ../aktin-client
          docker-compose -p $COMPOSE_PROJECT stop
        elif [ "$repoName" == "num-knoten" ]
        then
          cd fhir-server/blaze-server
          docker-compose -p $COMPOSE_PROJECT stop
        else
          echo "docker up $curRepo"
          docker-compose -p $COMPOSE_PROJECT stop
        fi
  fi
done
