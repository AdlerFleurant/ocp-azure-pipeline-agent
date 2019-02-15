#!/bin/sh
echo "[ENTRYPOINT] Azure DevOps Agent on RHEL 7.6-151]"

if [ -z "$SERVER_URL" -a -z "$ACCESS_TOKEN" -a -z "$AGENT_POOL" -a -z "$AGENT_NAME" ]; then
        echo "[ENTRYPOINT] SERVER_URL, ACCESS_TOKEN, AGENT_POOL, AGENT_NAME have to be populated with correct values."
        exit 1
fi

./config.sh --unattended --url $SERVER_URL --auth pat --token $ACCESS_TOKEN --pool $AGENT_POOL --agent $ACCESS_NAME --acceptTeeEula
./run.sh