FROM registry.redhat.io/rhscl/python-36-rhel7:1-41

ARG AZURE_DEVOPS_AGENT_VERSION=2.146.0
ENV AZURE_DEVOPS_AGENT_VERSION=2.146.0

USER root

COPY docker-entrypoint.sh $APP_ROOT/azure-devops-agent/entrypoint.sh

RUN cd $APP_ROOT && wget -nv \
    https://vstsagentpackage.azureedge.net/agent/$AZURE_DEVOPS_AGENT_VERSION/vsts-agent-linux-x64-${AZURE_DEVOPS_AGENT_VERSION}.tar.gz \
    -O azure-devops-agent/vsts-agent-linux-x64.tar.gz && cd azure-devops-agent && tar -zxf vsts-agent-linux-x64.tar.gz \
    && chmod +x entrypoint.sh && yum-config-manager --enable rhel-server-rhscl-7-rpms && \
    yum install rh-git218 dos2unix -y && ./bin/installdependencies.sh && yum clean all && \
    chown -R 1001:0 ${APP_ROOT} && fix-permissions ${APP_ROOT} -P

USER 1001

WORKDIR $APP_ROOT/azure-devops-agent

ENTRYPOINT ["./entrypoint.sh"]