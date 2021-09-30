# kaniko - Build Images In Kubernetes

`NOTE: kaniko is not an officially supported Google product`

[![Build Status](https://travis-ci.com/GoogleContainerTools/kaniko.svg?branch=master)](https://travis-ci.com/GoogleContainerTools/kaniko) [![Go Report Card](https://goreportcard.com/badge/github.com/GoogleContainerTools/kaniko)](https://goreportcard.com/report/github.com/GoogleContainerTools/kaniko)

kaniko is a tool to build container images from a Dockerfile, inside a container or Kubernetes cluster.

kaniko doesn't depend on a Docker daemon and executes each command within a Dockerfile completely in userspace.
This enables building container images in environments that can't easily or securely run a Docker daemon, such as a standard Kubernetes cluster.

kaniko is meant to be run as an image: `gcr.io/kaniko-project/executor`. We do **not** recommend running the kaniko executor binary in another image, as it might not work.

We'd love to hear from you!  Join us on [#kaniko Kubernetes Slack](https://kubernetes.slack.com/messages/CQDCHGX7Y/)

:mega: **Please fill out our [quick 5-question survey](https://forms.gle/HhZGEM33x4FUz9Qa6)** so that we can learn how satisfied you are with kaniko, and what improvements we should make. Thank you! :dancers:

## How does kaniko work?

The kaniko executor image is responsible for building an image from a Dockerfile and pushing it to a registry.
Within the executor image, we extract the filesystem of the base image (the FROM image in the Dockerfile).
We then execute the commands in the Dockerfile, snapshotting the filesystem in userspace after each one.
After each command, we append a layer of changed files to the base image (if there are any) and update image metadata.

## Known Issues

* kaniko does not support building Windows containers.
* Running kaniko in any Docker image other than the official kaniko image is not supported (ie YMMV).
  * This includes copying the kaniko executables from the official image into another image.
* kaniko does not support the v1 Registry API ([Registry v1 API Deprecation](https://engineering.docker.com/2019/03/registry-v1-api-deprecation/))

## How to update

```
git checkout -b release/v1.x.x
update Dockerfile line 1 image tag
git commit -am "update: kaniko v1.x.x"
git push --atomic origin release/v1.x.x v1.x.x
updated docker image will be build and push to https://github.com/orgs/kfit-dev/packages/container/package/kaniko
```
