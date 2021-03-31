#!/bin/bash

COMPOSE_PROJECT=codex-develop

echo $CODEX_REPOS

for i in ${CODEX_REPOS//,/ }
do
    # call your procedure/other scripts here below
    echo "$i"
done