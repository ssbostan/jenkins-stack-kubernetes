ARG JENKINS_VERSION=lts-slim
FROM jenkins/jenkins:$JENKINS_VERSION

# This code is related to "DevOps with Saeid" class.
# All rights reserved, Saeid Bostandoust <ssbostan@linuxmail.org>.

LABEL maintainer="Saeid Bostandoust <ssbostan@linuxmail.org>"

##### Install jenkins plugins

RUN jenkins-plugin-cli --plugins \
  configuration-as-code \
  workflow-aggregator \
  job-dsl \
  pipeline-model-definition \
  antisamy-markup-formatter \
  terraform \
  kubernetes \
  kubernetes-cli \
  kubernetes-cd \
  openshift-client \
  docker-plugin \
  docker-commons \
  docker-workflow \
  git \
  git-parameter \
  github \
  junit \
  cobertura \
  htmlpublisher \
  generic-webhook-trigger \
  ansible \
  credentials \
  credentials-binding \
  rebuild \
  run-condition \
  ssh \
  publish-over-ssh \
  copyartifact \
  metrics \
  prometheus \
  http_request \
  s3 \
  slack \
  mattermost

USER root

##### Install docker client

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https \
  ca-certificates curl \
  gnupg gnupg2 \
  software-properties-common \
  lsb-release

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y docker-ce-cli

##### Install ansible

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

RUN add-apt-repository "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ansible

##### Install kubernetes client

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
  chmod +x kubectl && mv kubectl /usr/local/bin/kubectl

##### Install helm

RUN curl -LO https://get.helm.sh/helm-v3.6.2-linux-amd64.tar.gz && \
  tar -zxf helm-v3.6.2-linux-amd64.tar.gz && \
  mv linux-amd64/helm /usr/local/bin/helm && \
  rm -rf helm-v3.6.2-linux-amd64.tar.gz linux-amd64

##### Install terraform

RUN curl -LO https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_amd64.zip && \
  unzip terraform_1.0.1_linux_amd64.zip && \
  mv terraform /usr/local/bin/terraform && \
  rm -f terraform_1.0.1_linux_amd64.zip

USER jenkins
