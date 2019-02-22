#!/bin/bash
echo "[ENTRYPOINT] Azure DevOps Agent on CentOS 7.6-151 for openshift origin client]"

if [ -z "$SERVER_URL" -a -z "$ACCESS_TOKEN" -a -z "$AGENT_POOL" -a -z "$AGENT_NAME" ]; then
        echo "[ENTRYPOINT] SERVER_URL, ACCESS_TOKEN, AGENT_POOL, AGENT_NAME have to be populated with correct values."
        exit 1
fi

export GIT_VERSION=2.18
export OPENSHIFT_ORIGIN_CLIENT_VERSION=v3.11.0
export OPENSHIFT_ORIGIN_CLIENT_BUILD_NUMBER=

source sourcefile

if ! ./config.sh --unattended --url $SERVER_URL --auth pat --token $ACCESS_TOKEN --pool $AGENT_POOL --agent $AGENT_NAME --acceptTeeEula ; then
    ./config.sh --unattended --url $SERVER_URL --auth pat --token $ACCESS_TOKEN --pool $AGENT_POOL --agent $AGENT_NAME --replace --acceptTeeEula
fi

scl enable rh-git218 -- bash -c ./run.sh