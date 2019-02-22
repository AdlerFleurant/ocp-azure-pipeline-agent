FROM centos:7

ARG AZURE_DEVOPS_AGENT_VERSION=2.147.1
ARG OPENSHIFT_ORIGIN_CLIENT_VERSION=v3.11.0
ARG OPENSHIFT_ORIGIN_CLIENT_BUILD_NUMBER=0cbc58b


COPY docker-entrypoint.sh /azure-devops-agent/entrypoint.sh

RUN chmod +x /azure-devops-agent/entrypoint.sh && \
    yum install centos-release-scl -y  && \
    yum install wget rh-git218 -y && \
    wget -nv \
    https://vstsagentpackage.azureedge.net/agent/$AZURE_DEVOPS_AGENT_VERSION/vsts-agent-linux-x64-${AZURE_DEVOPS_AGENT_VERSION}.tar.gz \
    -O /azure-devops-agent/vsts-agent-linux-x64.tar.gz && \
    wget -nv \
    https://github.com/openshift/origin/releases/download/$OPENSHIFT_ORIGIN_CLIENT_VERSION/openshift-origin-client-tools-${OPENSHIFT_ORIGIN_CLIENT_VERSION}-${OPENSHIFT_ORIGIN_CLIENT_BUILD_NUMBER}-linux-64bit.tar.gz \
    -O /azure-devops-agent/oc.tar.gz && \
    cd /azure-devops-agent && \
    tar -zxf vsts-agent-linux-x64.tar.gz && \
    tar -zxvf oc.tar.gz && \
    ./bin/installdependencies.sh && \
    mv openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit oc-client && \
    echo 'export PATH=/azure-devops-agent/oc-client:${PATH}'>>sourcefile && \
    mkdir /.kube && \
    chown 1001:0 /.kube && \
    rm /azure-devops-agent/vsts-agent-linux-x64.tar.gz && \
    rm oc.tar.gz && \
    yum -y clean all --enablerepo='*'

USER 1001

WORKDIR /azure-devops-agent

ENTRYPOINT ["./entrypoint.sh"]