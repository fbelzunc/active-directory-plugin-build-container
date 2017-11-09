#!/bin/bash
set -ex -o pipefail
#DOCKER_OPTS="--config-file=/etc/docker/daemon.json --storage-driver=${DOCKER_STORAGE_DRIVER}"
DOCKER_OPTS="--config-file=/etc/docker/daemon.json"
$(which dind) dockerd ${DOCKER_OPTS} >/dev/stdout 2>&1 &
sleep 1

mvn -B -Djenkins.test.timeout=1200 "$@"

#mvn  -Djenkins.test.timeout=1200 -Dtest=hudson.plugins.active_directory.docker.TheFlintstonesTest#validateNoDomain test
#mvn  -Djenkins.test.timeout=1200 -Dtest=hudson.plugins.active_directory.docker.TheFlintstonesTest#validateDomain test
exit 0
