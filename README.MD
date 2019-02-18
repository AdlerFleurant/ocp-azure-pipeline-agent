# Azure Pipeline Agent on RHEL 7.6
## Description

Azure Pipeline Agent is a build and release agent for Azure Pipelines and Team Foundation Server 2017 and beyond.
For more information please refer to: https://github.com/Microsoft/azure-pipelines-agent/blob/master/README.md. This
project aims to create a containerized Azure Pipeline Agent based on RHEL 7.6.

## How to use this image
### Environment Variables

In order to start this image, you **MUST** specify all the environment variables described below.

#### SERVER_URL

The Server URL of your Organization either on Azure DevOps (https://dev.azure.com/*{your-organization}*) or TFS 2017 and 
newer: (https://*{your_server}*/tfs).

#### ACCESS_TOKEN

The personal access token created using this reference: https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-linux?view=azure-devops#permissions

#### AGENT_POOL

The name of the agent pool where this agent will reside.

#### ACCESS_NAME

The name of the agent that will be created. If this agent already exist, it might fail.