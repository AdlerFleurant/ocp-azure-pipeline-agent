#!/bin/bash
echo "[ENTRYPOINT] Azure DevOps Agent on RHEL 7.6 for openshift client]"

if [ -z "$SERVER_URL" -a -z "$ACCESS_TOKEN" -a -z "$AGENT_POOL" -a -z "$AGENT_NAME" ]; then
        echo "[ENTRYPOINT] SERVER_URL, ACCESS_TOKEN, AGENT_POOL, AGENT_NAME have to be populated with correct values."
        exit 1
fi

export GIT_VERSION=2.18
export OPENSHIFT_CLIENT_VERSION=v3.11.88

if ! ./config.sh --unattended --url $SERVER_URL --auth pat --token $ACCESS_TOKEN --pool $AGENT_POOL --agent $AGENT_NAME --acceptTeeEula ; then
    ./config.sh --unattended --url $SERVER_URL --auth pat --token $ACCESS_TOKEN --pool $AGENT_POOL --agent $AGENT_NAME --replace --acceptTeeEula
fi

scl enable rh-git218 -- bash -c ./run.sh