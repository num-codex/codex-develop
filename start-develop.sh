#!/bin/sh

export COMPOSE_PROJECT=codex-develop

CODEX_REPOS=${CODEX_REPOS:-"codex-keycloak,codex-feasibility-gui,codex-feasibility-backend,codex-flare"}

readlink "$0" > /dev/null
if [ $? -ne 0 ]; then
  baseDir=$(dirname "$0")
else
  baseDir=$(dirname "$(readlink "$0")")
fi

export CODEX_CONCEPT_TREE_PATH=${CODEX_CONCEPT_TREE_PATH:-"$baseDir/ontology/codex-code-tree.json"}
export CODEX_TERM_CODE_MAPPING_PATH=${CODEX_TERM_CODE_MAPPING_PATH:-"$baseDir/ontology/term-code-mapping.json"}

for repoName in ${CODEX_REPOS//,/ }
do
  curRepo="$baseDir/$repoName"
  if [ -d "$curRepo" ]
  then
        cd $curRepo
        if [ "$repoName" == "codex-processes-ap2" ]
        then
          echo "codex-processes-ap2"
        elif [ "$repoName" == "codex-aktin-broker" ]
        then
          cd aktin-broker
          docker-compose -p $COMPOSE_PROJECT up -d
          sleep 10
          cd ../aktin-client
          docker-compose -p $COMPOSE_PROJECT up -d
        elif [ "$repoName" == "num-knoten" ]
        then
          cd fhir-server/blaze-server
          docker-compose -p $COMPOSE_PROJECT up -d
        else
          echo "docker up $curRepo"
          docker-compose -p $COMPOSE_PROJECT up -d
        fi
  fi
done
