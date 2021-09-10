# jenkins-stack-kubernetes

![Visits Badge](https://badges.pufler.dev/visits/ssbostan/jenkins-stack-kubernetes)
[![GitHub license](https://img.shields.io/github/license/ssbostan/jenkins-stack-kubernetes)](https://github.com/ssbostan/jenkins-stack-kubernetes/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/ssbostan/jenkins-stack-kubernetes)](https://github.com/ssbostan/jenkins-stack-kubernetes/stargazers)
![Twitter Follow](https://img.shields.io/twitter/follow/b9t_ir?style=social)
![LinkedIn Follow](https://shields.io/badge/style-ssbostan-black?logo=linkedin&label=LinkedIn&link=https://www.linkedin.com/in/ssbostan)

Stargaze ![GitHub Repo stars](https://img.shields.io/github/stars/ssbostan/jenkins-stack-kubernetes?style=social) if you find it useful.

**Attention**: This repository is a part of the "DevOps with Saeid" class.

Scripts and manifests to deploy Jenkins containers CI/CD stack on Kubernetes.

The [Docker-compose](https://github.com/ssbostan/jenkins-stack-docker) version is also available.

Copyright 2021 Saeid Bostandoust <ssbostan@linuxmail.org>

### This stack contains:

 - **Jenkins (with a complete set of tools and plugins).**
 - **Docker (on Kubernetes for building images and running Jenkins jobs).**
 - **Docker registry (as a image repository).**
 - **Gitea (as a version control system).**

### Installed tools and plugins:

  - Tools:
    1. Git client (latest)
    2. Docker client (latest)
    3. Kubernetes client (latest)
    4. Ansible (latest)
    5. Helm (3.6.2)
    6. Terraform (1.0.1)
  - Plugins:
    1. [34 most useful plugins](Dockerfile)

## How to deploy the stack:

The stack is tested on Kubernetes 1.20+, should works on earlier versions.

### Prerequisites:

  1. Kubernetes should supports LoadBalancer service type.
  2. Kubernetes should be configured to creating PVC dynamically.
  3. OpenSSL to creating self-signed certificates.

### Get started:

```sh
./deploy
```

![demo](https://raw.githubusercontent.com/ssbostan/jenkins-stack-kubernetes/master/demo.gif)

## How to contribute:

Don't hesitate! all contributions are welcomed.

### TODO:

  - [ ] Update tools to the latest stable version
  - [ ] SSL/TLS for Jenkins
  - [ ] SSL/TLS for Gitea
  - [ ] Expose Jenkins behind Ingress object
  - [ ] Expose Docker registry behind Ingress object
  - [ ] Expose Gitea behind Ingress object
