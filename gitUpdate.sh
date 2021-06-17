#!/bin/bash

gitBase="https://github.com/num-codex/"
repos=("codex-feasibility-gui" "codex-feasibility-backend" "codex-keycloak" "codex-processes-ap2" "codex-aktin-broker" "codex-sq2cql" "num-knoten" "broker" "codex-flare" "odm2fhir" "codex-blaze" "codex-gecco-to-ui-profiles")
baseDir=$(pwd)

echo "****updating base repo Develop****"
git pull

for repoName in ${repos[@]}
do
  curRepo="$baseDir/$repoName"
  if [ ! -d "$curRepo" ]
  then
        cd $baseDir
        echo "****initialising git repo $repoName****"
        git clone "$gitBase$repoName.git"
  else
        cd $repoName
        echo "****updating git repo $repoName****"
        git pull
        cd ..
  fi
done

#gitBase="https://github.com/rwth-imi/"
#repos=("flare-fhir")
#baseDir=$(pwd)
#
#for repoName in ${repos[@]}
#do
#  curRepo="$baseDir/$repoName"
#  if [ ! -d "$curRepo" ]
#  then
#        cd $baseDir
#        echo "****initialising git repo $repoName****"
#        git clone "$gitBase$repoName.git"
#  else
#        cd $repoName
#        echo "****updating git repo $repoName****"
#        git pull
#        cd ..
#  fi
#done

#gitBase="https://github.com/aktin/"
#repos=("broker")
#baseDir=$(pwd)
#
#for repoName in ${repos[@]}
#do
#  curRepo="$baseDir/$repoName"
#  if [ ! -d "$curRepo" ]
#  then
#        cd $baseDir
#        echo "****initialising git repo $repoName****"
#        git clone "$gitBase$repoName.git"
#  else
#        cd $repoName
#        echo "****updating git repo $repoName****"
#        git pull
#        cd ..
#  fi
#done

