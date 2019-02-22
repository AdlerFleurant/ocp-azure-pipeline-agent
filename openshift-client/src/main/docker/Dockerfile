FROM registry.redhat.io/openshift3/ose-cli:v3.11.88.2

ARG AZURE_DEVOPS_AGENT_VERSION=2.147.1

COPY docker-entrypoint.sh /azure-devops-agent/entrypoint.sh

RUN set AZURE_DEVOPS_AGENT_VERSION=$(curl -s https://api.github.com/repos/Microsoft/azure-pipelines-agent/releases/latest | python -c "import sys, json; print json.load(sys.stdin)['name']") \
    && chmod +x /azure-devops-agent/entrypoint.sh \
    && wget -nv \
    https://vstsagentpackage.azureedge.net/agent/$AZURE_DEVOPS_AGENT_VERSION/vsts-agent-linux-x64-${AZURE_DEVOPS_AGENT_VERSION}.tar.gz \
        -O /azure-devops-agent/vsts-agent-linux-x64.tar.gz \
    && wget -nv https://github.com/sclorg/s2i-base-container/blob/7a3edb0261ebba12f250620fd480a52df3fd4e76/core/root/usr/bin/fix-permissions?raw=true \
        -O /usr/bin/fix-permissions \
    && chmod +x /usr/bin/fix-permissions \
    && cd /azure-devops-agent \
    && tar -zxf vsts-agent-linux-x64.tar.gz \
    && yum-config-manager --enable rhel-server-rhscl-7-rpms \
    && yum install rh-git218 -y \
    && ./bin/installdependencies.sh \
    && yum clean all \
    && rm /azure-devops-agent/vsts-agent-linux-x64.tar.gz \
    && mkdir /.kube \
    && chown 1001:0 /.kube \
    && chown -R 1001:0 /azure-devops-agent \
    && fix-permissions /azure-devops-agent -P

USER 1001

WORKDIR /azure-devops-agent

ENTRYPOINT ["./entrypoint.sh"]