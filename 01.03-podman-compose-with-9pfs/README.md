# Purpose

This unit shows an example of `podman-compose` if you enabled the `9pfs`
[workaround](./../01.01-single-container/README.md#volume-mount-workaround-for-macos)
in your environment.

## Usage

We store the present working directory into an environment variable `PWD`,
and use it in the compose file. This is because `9pfs` mirrors the host
file system as a virtual file system into the qemu Podman VM. So the exact
path of a file on the host can be easily mapped to the podman-compose serivce
without having to copy files into the Podman machine.

```bash
$ PWD=$(pwd)
$ podman-compose up
$ podman-compose down
```
