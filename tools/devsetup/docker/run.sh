#!/bin/bash
set -e

cd $(dirname $0)/../../..

CONTAINER="postgresqleu/runtime:latest"
MOUNTS="-v $(pwd):/pgeu"

if [[ "$1" == "" ]]; then
    echo Starting server
    docker run --rm -it ${MOUNTS} -p ${HTTP_PORT:-8002}:8002 ${CONTAINER}
else
    echo Running command $@
    docker run --rm -it ${MOUNTS} ${CONTAINER} $@
fi
