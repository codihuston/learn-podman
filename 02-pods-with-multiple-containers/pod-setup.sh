#!/bin/bash

# create a pod, you must map all ports that will be exposed at creation time!
pod=$(podman pod create)

# list pod
podman pod ls

# add to the pod
podman run -dt --pod "$pod" -p 32597:80 quay.io/libpod/alpine_nginx:latest

# list pod, note containers
podman pod ls

# create new pod and add to it
podman run -dt --pod new:nginx -p 32597:80 docker.io/library/nginx
