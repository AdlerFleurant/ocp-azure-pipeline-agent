FROM registry.redhat.io/rhel7/rhel:7.6-151

ARG AZURE_DEVOPS_AGENT_VERSION=2.146.0

COPY docker-entrypoint.sh /azure-devops-agent/entrypoint.sh

RUN chmod +x /azure-devops-agent/entrypoint.sh && yum install wget -y && wget \
    https://vstsagentpackage.azureedge.net/agent/$AZURE_DEVOPS_AGENT_VERSION/vsts-agent-linux-x64-${AZURE_DEVOPS_AGENT_VERSION}.tar.gz \
    -O /azure-devops-agent/vsts-agent-linux-x64.tar.gz && cd /azure-devops-agent && tar -zxvf vsts-agent-linux-x64.tar.gz \
    && ./bin/installdependencies.sh

USER 1001

WORKDIR /azure-devops-agent

ENTRYPOINT ["./entrypoint.sh"]