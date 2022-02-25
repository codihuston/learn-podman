# Purpose

This unit shows an example of `podman-compose`. This is a separate CLI that
uses `podman` under-the-hood.

> Important: this unit assumes you are using vanilla Podman (not the
> version built with 9pfs). This compose file will fail to find
> the html directory specified otherwise due to the mirroring/sharing of
> the host fs.

## Install

See the [github repo](https://github.com/containers/podman-compose) for installation instructions.

## Usage

The usage appears to be 1:1 with `docker-compose`. The same issue with volume
mounting in MacOS exists. You will need to copy the directories/files
to-be-mounted by the compose file prior to running it. See
[Volume Mounts Preqrequisite for MacOS](./../01-single-container/README.md#volume-mounts-prerequisite-for-macos).

```bash
$ podman-compose --help
$ podman-compose up --help
$ podman-compose up
```