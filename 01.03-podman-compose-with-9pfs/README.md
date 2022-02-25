# Purpose

This unit shows an example of `podman-compose`. This is a separate CLI that
uses `podman` under-the-hood.

## Install

See the [github repo](https://github.com/containers/podman-compose) for installation instructions.

## Usage

The usage appears to be 1:1 with `docker-compose`.

```bash
$ PWD=$(pwd)
$ podman-compose --help
$ podman-compose up --help
$ podman-compose up
```