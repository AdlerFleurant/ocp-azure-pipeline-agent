#!/bin/sh
echo "[ENTRYPOINT] Azure DevOps Agent on RHEL 7.6-151]"

if [ -z "$SERVER_URL" -a -z "$ACCESS_TOKEN" -a -z "$AGENT_POOL" -a -z "$AGENT_NAME" ]; then
        echo "[ENTRYPOINT] SERVER_URL, ACCESS_TOKEN, AGENT_POOL, AGENT_NAME have to be populated with correct values."
        exit 1
fi

function unregister(){
    echo unregistering
    ./config.sh remove
}

trap unregister SIGTERM

./config.sh --unattended --url $SERVER_URL --auth pat --token $ACCESS_TOKEN --pool $AGENT_POOL --agent $AGENT_NAME --acceptTeeEula
scl enable rh-git218 -- bash -c ./run.sh &

wait "$!"