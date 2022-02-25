# Purpose

This repository is a tour-de-force of Podman. Red Hat has foregone the use
of `docker` and `docker-compose` on its Enterprise Linux distributions (`RHEL`).
This repository will only focus on `Podman v3.4`

## About Podman

Features of Podman, similar to Docker:

1. Managing containers and images (OCI-complaint/Docker images)
2. Networking between containers and pods (CNI, Netavark, slirp4netns)
3. Volume-mounting into containers
4. Support for rootless containers and pods
5. Commands are mostly 1:1 with Docker for management of containers, mounting
volumes, etc. Where the CLI differs is with the use of Pods
1. Can co-exist with Docker on the same host

Features unique to Podman:

1. Pods for grouping containers
2. Signing images
3. Supports the playing of structured data (read: Kubernetes YAML) based on
containers, pods, or volumes (The `docker-compose` of podman) via
`podman play kube`

Nuances of Podman:

1. Daemonless
1. Based on `libpod`, a library for container lifecycle management for: pods,
container-images, and volumes
1. Uses `Buildah` for building images, uses `Containerfiles` (and supports
Dockerfiles)
1. Image fetching is done against multiple registries. Be sure to explicitly
specify your TLD, i.e.) `docker.io/library/nginx`

Podman relies on an OCI compliant Container Runtime, such as `runc`, `crun`,
`runv`, etc. to interface with the operating system to create the running
containers. This is configurable, and is noted under the `podman info` command.

If Podman is running on non-linux platforms, such as `MacOS` a
Virtual Machine is required. The `Windows WSL2` platform uses an actual linux
kernel and can be used natively by Podman. This is the same for Docker in both
cases. This lab focuses on use of Podman with a Mac.

Review the [How Podman runs on MacOS reference](#references) for more
detail.

## Getting Started

This repository attempts to outline Podman features in a progressive manner.
Please begin at [01-single-container](./01-single-container/README.md)

## References
- [Github: Podman](https://github.com/containers/podman)
- [What is Podman?](https://docs.podman.io/en/latest)
- [Installation](https://podman.io/getting-started/installation)
- [How Podman runs on MacOS](https://www.redhat.com/sysadmin/podman-mac-machine-architecture)
- [Tutorials](https://docs.podman.io/en/latest/Tutorials.html)
- [Buildah for Building Images](https://buildah.io/)
- [Build Kubernetes Pods with Podman play kube](https://www.redhat.com/sysadmin/podman-play-kube-updates)
- [v3.4 API Reference](https://docs.podman.io/en/latest/_static/api.html?version=v3.4)